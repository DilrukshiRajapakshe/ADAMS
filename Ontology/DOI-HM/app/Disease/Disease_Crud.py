from app.CONSTANT import ONE_DISEASE
from app.Main_Crud import getALL, getIndividual


def description(_Intent, _action):
    return getIndividual(getALL(ONE_DISEASE(_Intent[0])), _action)[0]


