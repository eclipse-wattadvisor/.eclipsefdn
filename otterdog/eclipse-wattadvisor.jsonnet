local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-wattadvisor') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "WattAdvisor Project",
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "WattAdvisor website",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: true,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('WattAdvisor') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "WattAdvisor code repo",
      web_commit_signoff_required: false,
    }
  ],
}
