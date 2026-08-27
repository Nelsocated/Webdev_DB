import { Request, Response, Router } from "express";
import { pool } from "./db";
import { Pie } from "./types";
import { validateResource } from "./validate";
import { createPieSchema, updatePieSchema } from "./schemas";
import { authenticateToken } from "./authMiddleware";

const router = Router();

router.get("/", async (req: Request, res: Response) => {
  try {
    const { search } = req.query;
    const result = await pool.query(
      `
      SELECT * 
      FROM pies
      WHERE name ILIKE $1 
      ORDER BY id ASC
      `,
      ["%" + (search ?? "") + "%"],
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: (error as Error).message });
  }
});

router.post(
  "/",
  authenticateToken,
  validateResource(createPieSchema),
  async (req: Request, res: Response) => {
    const { name, crust_type, filling, is_baked, slice_count }: Pie = req.body;
    try {
      const result = await pool.query(
        `INSERT INTO pies (name, crust_type, filling, is_baked, slice_count)
       VALUES ($1, $2, $3, $4, $5)
       RETURNING *`,
        [name, crust_type, filling, is_baked ?? false, slice_count ?? 8],
      );
      res.status(201).json(result.rows[0]);
    } catch (error) {
      res.status(500).json({ error: (error as Error).message });
    }
  },
);

router.put(
  "/:id",
  authenticateToken,
  validateResource(updatePieSchema),
  async (req: Request, res: Response) => {
    const { id } = req.params;
    const { name, crust_type, filling, is_baked, slice_count } = req.body;
    try {
      const result = await pool.query(
        `UPDATE pies
       SET name = $1, crust_type = $2, filling = $3, is_baked = $4, slice_count = $5
       WHERE id = $6
       RETURNING *`,
        [name, crust_type, filling, is_baked, slice_count, id],
      );
      if (result.rows.length === 0) {
        return res.status(404).json({ error: "Pie not found" });
      }
      res.json(result.rows[0]);
    } catch (error) {
      res.status(500).json({ error: (error as Error).message });
    }
  },
);

router.delete(
  "/:id",
  authenticateToken,
  async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
      const result = await pool.query(
        `DELETE FROM pies
      WHERE id = $1
      RETURNING *`,
        [id],
      );
      if (result.rows.length === 0) {
        return res.status(404).json({ error: "Pie not found" });
      }
      res.json(result.rows[0]);
    } catch (error) {
      res.status(500).json({ error: (error as Error).message });
    }
  },
);

export default router;
