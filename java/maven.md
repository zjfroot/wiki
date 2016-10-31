Stackoverflow favorites

Building a runnable jar with Maven 2 http://stackoverflow.com/questions/2022032/building-a-runnable-jar-with-maven-2

Maven parent pom vs modules pom http://stackoverflow.com/questions/1992213/maven-parent-pom-vs-modules-pom

Maven versions, subversion branches and local repository http://stackoverflow.com/questions/1103052/maven-versions-subversion-branches-and-local-repository

Why does Maven have such a bad rep? [closed] http://stackoverflow.com/questions/861382/why-does-maven-have-such-a-bad-rep

What are your impressions of Maven? [closed] http://stackoverflow.com/questions/303853/what-are-your-impressions-of-maven


Eclipse:

Add M2_REPO to work space
  mvn -Declipse.workspace=<path-to-eclipse-workspace> eclipse:add-maven-repo

Create eclipse project files from existing project:
  mvn eclipse:eclipse

Reference: http://maven.apache.org/guides/mini/guide-ide-eclipse.html


=== PermGen Out Of Memory Errors on Maven test, surefire ===


Surefire ignores M2_OPS, because it forks a new jvm by default

Need to do like this:

    <plugin>
     <groupid>org.apache.maven.plugins</groupId>
     <artifactid>maven-surefire-plugin</artifactId>
     <version>2.11</version>
     <configuration>
      <excludes>
       <exclude>${testExcludeString}</exclude>
      </excludes>
      <argline>-Xms512m -Xmx1024m -XX:MaxPermSize=512m</argLine>
     </configuration>
    </plugin> 

    Or
    ...
    <plugin>
     <groupid>org.apache.maven.plugins</groupId>
     <artifactid>maven-surefire-plugin</artifactId>
     <version>2.11</version>
     <configuration>
      <excludes>
       <exclude>${testExcludeString}</exclude>
      </excludes>
      <argline>${maven.test.argline}</argLine>
     </configuration>
    </plugin>
    ...

And And then pass it in command like
  mvn test -Dmaven.test.argline='-Xms512m-Xmx1024m-XX:MaxPermSize=512m'.

overrride surefire report name: `maven -Dsurefire.reportNameSuffix=xxx`


### use proxy/mirror repository from nexus or artifactory:

Check especially "Advanced Mirror Specification" in
http://maven.apache.org/guides/mini/guide-mirror-settings.html
