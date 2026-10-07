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
