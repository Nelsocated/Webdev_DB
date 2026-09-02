const API_BASE = "http://localhost:3000/auth";

export const login = async (
  username: string,
  password: string,
): Promise<{ token: string }> => {
  const response = await fetch(`${API_BASE}/login`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ username, password }),
  });

  if (!response.ok) throw new Error("Invalid credentials.");
  return response.json();
};

export const register = async (
  username: string,
  password: string,
): Promise<void> => {
  const response = await fetch(`${API_BASE}/register`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ username, password }),
  });

  if (!response.ok) throw new Error("Failed to register.");
};
