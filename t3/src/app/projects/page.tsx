"use client";

import { api } from "~/trpc/react";

export default function projectDashboard() {
  const { data: projects, isLoading } = api.project.getAll.useQuery();

  if (isLoading)
    return <div className="p-8 text-gray-500">Loading enterprise data...</div>;

  return (
    <div className="space-y-4">
      {projects?.map((project) => (
        <div key={project.id} className="rounded border bg-white p-4 shadow-sm">
          <h2 className="text-lg font-semibold">{project.title}</h2>
          <p className="text-sm text-gray-600">
            {project.description ?? "No descriptio provided."}
          </p>
          <span className="mt-2 inline-block text-xs font-medium text-blue-600">
            {project.tasks.length} Active Tasks
          </span>
        </div>
      ))}
    </div>
  );
}
