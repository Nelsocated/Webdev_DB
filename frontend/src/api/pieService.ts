import type { Pie } from "../types";

const API_BASE = "http://localhost:3000/api";

export const fetchPies = async (): Promise<Pie[]> => {
  const response = await fetch(`${API_BASE}/pies`);
  if (!response.ok) throw new Error("Failed to fetch pies.");
  return response.json();
};

export const postPies = async (): Promise<Pie> => {
  const response = await fetch(`${API_BASE}/pies`);
  if (!response.ok) throw new Error("Failed to post pies.");
  return response.json();
};
