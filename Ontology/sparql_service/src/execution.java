import org.apache.jena.query.*;
import org.apache.jena.rdf.model.Literal;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.sparql.core.DatasetGraph;
import org.apache.jena.sparql.engine.http.QueryExceptionHTTP;

public class execution {
    public static void main(String[] args) {
        String service="http://localhost:3030/ds/sparql";
        String query="PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>\n" +
                "SELECT * {?Approved adams:Uses adams:DIS0001}";

        QueryExecution qe=QueryExecutionFactory.sparqlService(service, query);
        ResultSet rs = qe.execSelect();
        while (rs.hasNext()){
            QuerySolution s=rs.nextSolution();
            System.out.println(s);
        }

    }
}