local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-wattadvisor') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "WattAdvisor Project",
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('WattAdvisor') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "WattAdvisor code repo",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "WattAdvisor website",
      gh_pages_build_type: "workflow",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: true,
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
