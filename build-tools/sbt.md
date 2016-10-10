### Force to use internal repo

http://www.scala-sbt.org/0.13/docs/Proxy-Repositories.html

Create a file `.sbtopts` in project's root with:

    -Dsbt.override.build.repos=true -Dsbt.repository.config=${PWD}/nexus.repos
    
create file `nexus.repo` in project's root with:

```
[repositories]
  local
  nexus-ivy-proxy-releases: http://<ivy_internal_repo>/repository/ivy-group/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
  nexus-maven-proxy-releases: http://<maven_internal_repo>
```
