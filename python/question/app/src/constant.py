URL = 'http://localhost:3030/ds/sparql'

QUESTION = """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Name ?Name ;
                         adams:Question_Type ?Question_Type ;
                         adams:Synonyms ?Synonyms ;
                         adams:Type ?Type ;
                         adams:Name_Type ?Name_Type ;
                         VALUES ?Type {"Question"}
                   }
               """
DRUG = """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Age18 ?Age18 ;
                         adams:Ages0-12 ?Ages0-12 ;
                         adams:Ages12-17 ?Ages12-17 ;
                         adams:Nature ?Nature ;
                         adams:Description ?Description ;
                         adams:Name ?Name ;
                         adams:Reason ?Reason ;
                         adams:Side_Effects ?Side_Effects ;
                         adams:Synonyms ?Synonyms ;
                         adams:Type ?Type ;
                         adams:Use ?Use ;
                         VALUES ?Type {"Drug"}
                   }
               """
SYMPTOMS = """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Name ?Name ;
                         adams:Description ?Description ;
                         adams:Synonyms ?Synonyms ;
                         adams:Type ?Type ;
                         VALUES ?Type {"Symptoms"}
                   }
               """
DISEASE = """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Name ?Name ;
                         adams:Description ?Description ;
                         adams:Side_Effects ?Side_Effects ;
                         adams:Synonyms ?Synonyms ;
                         adams:Type ?Type ;
                         adams:Specific ?Specific ;
                         VALUES ?Type {"Disease"}
                   }
               """


def ONE_DISEASE(value):
    return """
                       PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                       SELECT *
                       WHERE {
                             ?adams adams:Name ?Name ;
                             adams:Description ?Description ;
                             adams:Side_Effects ?Side_Effects ;
                             adams:Synonyms ?Synonyms ;
                             adams:Type ?Type ;
                             adams:Specific ?Specific ;
                             VALUES ?Name {'""" + value + """'}
                             VALUES ?Type {"Disease"}
                       }
                   """


def ONE_DRUG(value):
    return """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Age18 ?Age18 ;
                         adams:Ages0-12 ?Ages0-12 ;
                         adams:Ages12-17 ?Ages12-17 ;
                         adams:Nature ?Nature ;
                         adams:Description ?Description ;
                         adams:Name ?Name ;
                         adams:Reason ?Reason ;
                         adams:Side_Effects ?Side_Effects ;
                         adams:Synonyms ?Synonyms ;
                         adams:Type ?Type ;
                         adams:Use ?Use ;
                         VALUES ?Type {"Drug"}
                         VALUES ?Name {'""" + value + """'}
                   }
               """


def ONE_SYMPTOMS(value):
    return """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Name ?Name ;
                         adams:Description ?Description ;
                         adams:Synonyms ?Synonyms ;
                         adams:Type ?Type ;
                         VALUES ?Type {"Symptoms"}
                         VALUES ?Name {'""" + value + """'}
                   }
               """

def ONE_QUESTION(value):
    return """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Name ?Name ;
                         adams:Question_Type ?Question_Type ;
                         adams:Synonyms ?Synonyms ;
                         adams:Type ?Type ;
                         adams:Name_Type ?Name_Type ;
                         VALUES ?Type {"Question"}
                         VALUES ?Name {'""" + value + """'}
                   }
            """