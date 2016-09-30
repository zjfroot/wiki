### keep a build forever, from another job

Install groovy plugin, executate system groovy script as a step:

    def jobName = build.buildVariableResolver.resolve('jobName')
    def buildNr = build.buildVariableResolver.resolve('buildNr')

    def job = jenkins.model.Jenkins.instance.getItem(jobName)
    def build = job.getBuild(buildNr)
    build.keepLog(true)
