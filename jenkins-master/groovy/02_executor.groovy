import jenkins.model.*;
import org.apache.log4j.*
import hudson.model.Node.Mode

Logger log = Logger.getInstance('executor.groovy');
log.info('executor.groovy - Start nb executors configuration');

try {
    String tmp = System.getenv("JENKINS_NB_EXECUTORS") ? System.getenv("JENKINS_NB_EXECUTORS") : "2";
    int NB_EXEC = Integer.parseInt(tmp);
    Jenkins jenkins =  Jenkins.getInstance();
    jenkins.setNumExecutors(NB_EXEC);
    jenkins.save();
}
catch (Exception ex){
    log.error('== nb-executor.groovy :' + ex.message + '\n' + ex.getStackTrace());
}

log.info('== nb-executor.groovy - Start master mode configuration');

