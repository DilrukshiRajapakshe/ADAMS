3

OWL = '../static/adams-medil.owl'

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
                         VALUES ?Type {"Disease_Prescribe"}
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
                         ?adams adams:Name ?Name ;
                         adams:AgeEighteen ?AgeEighteen ;
                         adams:TwelveToEighteen ?TwelveToEighteen ;
                         adams:BelowTwelve ?BelowTwelve ;
                         adams:Nature ?Nature ;
                         adams:Description ?Description ;
                         adams:Reason ?Reason ;
                         adams:Side_Effects ?Side_Effects ;
                         adams:Synonyms ?Synonyms ;
                         adams:Type ?Type ;
                         adams:Use ?Use ;
                         adams:Usage ?Usage ;
                         VALUES ?Name {'""" + value + """'}
                         VALUES ?Type {"Drug"}
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


def NAME(value):
    return """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Name ?Name ;
                         adams:Type ?Type ;
                         adams:Synonyms ?Synonyms ;
                         VALUES ?Type {'""" + value + """'}
                   }
            """


def SYMPTOMS_DESCRIPTION(value1, value2):
    return """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Name ?Name ;
                         adams:Type ?Type ;
                         adams:Description ?Description ;
                         VALUES ?Name {'""" + value1 + """'}
                         VALUES ?Type {'""" + value2 + """'}
                   }
            """


ALL_SYMPTOMS_DESCRIPTION = """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                   WHERE {
                         ?adams adams:Name ?Name ;
                         adams:Type ?Type ;
                         adams:Description ?Description ;
                         VALUES ?Type {"Symptoms"}
                   }
            """


def SPECIFIC(value):
    return """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                    WHERE { 
                        ?adams adams:Name ?Name ;
                        adams:Specific ?Specific ;
                        VALUES ?Name {'""" + value + """'} 
                    }   
            """

def NAME_TYPE(value):
    return """
                   PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>
                   SELECT *
                    WHERE { 
                        ?adams adams:Name ?Name ;
                        adams:Type ?Type ;
                        VALUES ?Name {'""" + value + """'} 
                    }   
            """