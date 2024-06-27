local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-wattadvisor') {
  settings+: {
    description: "",
    name: "WattAdvisor Project",
    web_commit_signoff_required: false,
  },
  _repositories+:: [
    orgs.newRepo('WattAdvisor') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Generic and simulative optimization model in combination with data preprocessing that focuses on the determination of cost-minimal sets of energy components.",
      web_commit_signoff_required: false,
      topics: ["energy", "optimization", "energy-system", "renewable-energy", "economics", "transformation"]
    },
    orgs.newRepo('website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse WattAdvisor website",
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
