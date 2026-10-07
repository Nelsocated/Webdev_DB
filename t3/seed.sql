-- Seed: one organization and its projects.
-- Prisma generates cuids and @updatedAt client-side, so ids and "updatedAt" are set explicitly here.

INSERT INTO "Organization" ("id", "name", "createdAt", "updatedAt")
VALUES ('org_acme_001', 'Acme Corp', NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

INSERT INTO "Project" ("id", "title", "description", "orgId", "createdAt", "updatedAt")
VALUES
  ('proj_001', 'Website Redesign',    'Refresh the marketing site with the new brand.',      'org_acme_001', NOW(), NOW()),
  ('proj_002', 'Mobile App Launch',   'Ship v1 of the iOS and Android apps.',                'org_acme_001', NOW(), NOW()),
  ('proj_003', 'Data Warehouse',      'Migrate reporting to a central warehouse.',           'org_acme_001', NOW(), NOW()),
  ('proj_004', 'Security Audit',      'Annual third-party security review and remediation.', 'org_acme_001', NOW(), NOW()),
  ('proj_005', 'Internal Tools',      NULL,                                                  'org_acme_001', NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

-- Tasks (unassigned: "assignedUserId" is left NULL)
INSERT INTO "Task" ("id", "title", "status", "projectId", "createdAt", "updatedAt")
VALUES
  ('task_001', 'Audit current site content',      'COMPLETED',   'proj_001', NOW(), NOW()),
  ('task_002', 'Design new homepage mockups',     'IN_PROGRESS', 'proj_001', NOW(), NOW()),
  ('task_003', 'Implement responsive nav',        'PENDING',     'proj_001', NOW(), NOW()),
  ('task_004', 'Set up app store accounts',       'COMPLETED',   'proj_002', NOW(), NOW()),
  ('task_005', 'Build onboarding flow',           'IN_PROGRESS', 'proj_002', NOW(), NOW()),
  ('task_006', 'Beta test with pilot users',      'PENDING',     'proj_002', NOW(), NOW()),
  ('task_007', 'Define warehouse schema',         'IN_PROGRESS', 'proj_003', NOW(), NOW()),
  ('task_008', 'Write ETL pipelines',             'PENDING',     'proj_003', NOW(), NOW()),
  ('task_009', 'Run penetration test',            'PENDING',     'proj_004', NOW(), NOW()),
  ('task_010', 'Patch critical findings',         'PENDING',     'proj_004', NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;
