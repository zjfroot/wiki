### keep a build forever, from another job

Install groovy plugin, executate system groovy script as a step:

    def jobName = build.buildVariableResolver.resolve('jobName')
    def buildNr = build.buildVariableResolver.resolve('buildNr')

    def job = jenkins.model.Jenkins.instance.getItem(jobName)
    def build = job.getBuild(buildNr)
    build.keepLog(true)

### fix jenkins 2 text area wrapping problem

https://issues.jenkins-ci.org/browse/JENKINS-27367

Released in 2.19.3 and 2.26

For version before the fix, it can be fixed by a user css. (jenkins_home/userContent/user.css) with theme plugin. Point the url of theme css to http:/yourjenkins/userContent/user.css

    td.setting-main .CodeMirror {
      display: table;
      table-layout: fixed;
      width: 100%;
    }
