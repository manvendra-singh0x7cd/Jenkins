import hudson.plugins.git.*;
import jenkins.model.Jenkins;


def scm = new GitSCM(System.getenv("JENKINS_JOB"))
scm.branches = [new BranchSpec(System.getenv("JENKINS_BRANCH"))];

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition(scm, "Jenkinsfile")

def parent = Jenkins.instance
def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(parent, "paymerang-dev")
job.definition = flowDefinition

parent.reload()
