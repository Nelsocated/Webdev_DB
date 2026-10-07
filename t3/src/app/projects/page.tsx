"use client";

import { useState } from "react";
import { api } from "~/trpc/react";

export default function ProjectDashboard() {
  const [title, setTitle] = useState("");

  const utils = api.useUtils();
  const { data: projects, isLoading } = api.project.getAll.useQuery();
  const createProject = api.project.create.useMutation({
    onSuccess: () => {
      void utils.project.getAll.invalidate();
      setTitle("");
    },
  });

  if (isLoading)
    return <div className="p-8 text-gray-500">Loading enterprise data...</div>;

  return (
    <main className="mx-auto max-w-4xl p-8">
      <h1 className="mb-6 text-2xl font-bold">Enterprise Projects</h1>

      {/* Creation Form */}
      <div className="mb-8 flex gap-4">
        <input
          type="text"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          placeholder="New Project Title..."
          className="flex-1 rounded border px-4 py-2"
        />
        <button
          onClick={() => createProject.mutate({ title, orgId: "org_acme_001" })}
          disabled={createProject.isPending}
          className="rounded bg-blue-600 px-6 py-2 font-medium text-white hover:bg-blue-700 disabled:opacity-50"
        >
          {createProject.isPending ? "Creating..." : "Create Project"}
        </button>
      </div>

      {/* Project List */}
      <div className="space-y-4">
        {projects?.map((project) => (
          <div
            key={project.id}
            className="rounded border bg-white p-4 shadow-sm"
          >
            <h2 className="text-lg font-semibold">{project.title}</h2>
            <p className="text-sm text-gray-600">
              {project.description ?? "No description provided."}
            </p>
            <span className="mt-2 inline-block text-xs font-medium text-blue-600">
              {project.tasks.length} Active Tasks
            </span>
          </div>
        ))}
      </div>
    </main>
  );
}
