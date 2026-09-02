import type React from "react";
import { useContext, useEffect } from "react";
import { PieContext } from "../context/pieContext";
import { fetchPies } from "../api/pieService";
import { Card, Grid } from "./styles";

export const PieList: React.FC = () => {
  const context = useContext(PieContext);
  if (!context) throw new Error("PieList must be used within a PieProvider");

  const { state, dispatch } = context;

  useEffect(() => {
    const loadPies = async () => {
      dispatch({ type: "FETCH_START" });

      try {
        const data = await fetchPies();
        dispatch({ type: "FETCH_SUCCESS", payload: data });
      } catch (error) {
        dispatch({ type: "FETCH_ERROR", payload: (error as Error).message });
      }
    };
    loadPies();
  }, [dispatch]);

  if (state.loading) return <p>Loading Pies...</p>;
  if (state.error) return <p>Error: {state.error}</p>;

  return (
    <Grid>
      {state.pies.map((pie) => (
        <Card key={pie.id}>
          <h4>{pie.name}</h4>
          <p>
            <strong>Crust:</strong> {pie.crust_type}
          </p>
          <p>
            <strong>Filling:</strong> {pie.filling}
          </p>
          <p>{pie.is_baked ? "Baked" : "Raw"}</p>
          <p>{pie.slice_count} Slices</p>
        </Card>
      ))}
    </Grid>
  );
};
