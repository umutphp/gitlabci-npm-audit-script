# gitlabci-npm-audit-script
The script is for adding 'npm audit' as a step to GitlabCI pipeline. [stedolan/jq/](https://github.com/stedolan/jq/) is used to parse the json on bash.

The script parses the 'npm audit' result json and gives the proper exit code. When 'Exit 1' is fired, a summary and a detailed json is displayed.

A sample step definition in .gitlab-ci.yml would be;

```
test_async:
  stage: check
  image:node
  script:
   - bash /path/to/npm-audit-step.sh
```
