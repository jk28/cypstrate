Feature: Consistent predictions

  Scenario Outline: Predictions stay consistent with previous versions
    Given an input molecule specified by '<input_smiles>'
    And the input type is 'smiles'
    And the CYPstrate model
    And the prediction mode is '<prediction_mode>'
    
    When the model generates predictions for the molecule representations
    
    Then the result should be a pandas DataFrame
    And the value in column 'name' should be '<name>'
    And the value in column 'prediction_1a2' should be '<prediction_1a2>'
    And the value in column 'neighbor_1a2' should be '<neighbor_1a2>'
    And the value in column 'prediction_2a6' should be '<prediction_2a6>'
    And the value in column 'neighbor_2a6' should be '<neighbor_2a6>'
    And the value in column 'prediction_2b6' should be '<prediction_2b6>'
    And the value in column 'neighbor_2b6' should be '<neighbor_2b6>'
    And the value in column 'prediction_2c8' should be '<prediction_2c8>'
    And the value in column 'neighbor_2c8' should be '<neighbor_2c8>'
    And the value in column 'prediction_2c9' should be '<prediction_2c9>'
    And the value in column 'neighbor_2c9' should be '<neighbor_2c9>'
    And the value in column 'prediction_2c19' should be '<prediction_2c19>'
    And the value in column 'neighbor_2c19' should be '<neighbor_2c19>'
    And the value in column 'prediction_2d6' should be '<prediction_2d6>'
    And the value in column 'neighbor_2d6' should be '<neighbor_2d6>'
    And the value in column 'prediction_2e1' should be '<prediction_2e1>'
    And the value in column 'neighbor_2e1' should be '<neighbor_2e1>'
    And the value in column 'prediction_3a4' should be '<prediction_3a4>'
    And the value in column 'neighbor_3a4' should be '<neighbor_3a4>'

    Examples:
    | prediction_mode  | input_smiles                                                                                                  | name                     | preprocessed_smiles                                                          | prediction_1a2 | neighbor_1a2 | prediction_2a6 | neighbor_2a6 | prediction_2b6 | neighbor_2b6 | prediction_2c8 | neighbor_2c8 | prediction_2c9 | neighbor_2c9 | prediction_2c19 | neighbor_2c19 | prediction_2d6 | neighbor_2d6 | prediction_2e1 | neighbor_2e1 | prediction_3a4 | neighbor_3a4 | errors
    | best_performance | C1=NC2=C(N1COCCO)N=C(NC2=O)N Aciclovir                                                                        | Aciclovir                | Nc1nc(=O)c2ncn(COCCO)c2[nH]1                                                 | No prediction  | 0.75         | Non-substrate  | 0.75         | Non-substrate  | 0.75         | Non-substrate  | 0.75         | Non-substrate  | 0.75         | Non-substrate   | 0.75          | Non-substrate  | 0.75         | Non-substrate  | 0.75         | Non-substrate  | 0.75         |                                                    
    | best_performance | CCN(CC)CCOc1c(I)cc(cc1I)C(=O)c2c3ccccc3oc2CCCC Amiodarone                                                     | Amiodarone               | CCCCc1oc2ccccc2c1C(=O)c1cc(I)c(OCCN(CC)CC)c(I)c1                             | Substrate      | 1            | Non-substrate  | 0.74         | No prediction  | 0.74         | No prediction  | 0.74         | Non-substrate  | 1            | Substrate       | 1             | Substrate      | 1            | Non-substrate  | 1            | Substrate      | 1            |                                                    
    | best_performance | C1=CC(=C(C=C1[As]=[As]C2=CC(=C(C=C2)O)N)N)O.Cl.Cl Arsphenamine (Salvarsan)                                    | Arsphenamine (Salvarsan) | (none)                                                                       | (none)         | (none)       | (none)         | (none)       | (none)         | (none)       | (none)         | (none)       | (none)         | (none)       | (none)          | (none)        | (none)         | (none)       | (none)         | (none)       | (none)         | (none)       | !1, E1                                             
    | best_performance | C1CNP(=O)(OC1)N(CCCl)CCCl Cyclophosphamide                                                                    | Cyclophosphamide         | O=P1(N(CCCl)CCCl)NCCCO1                                                      | No prediction  | 1            | Substrate      | 1            | Substrate      | 1            | Substrate      | 1            | No prediction  | 1            | Substrate       | 1             | Non-substrate  | 1            | Non-substrate  | 1            | Substrate      | 1            |                                                    
    | best_performance | C[C@H]1[C@H]([C@H](C[C@@H](O1)O[C@H]2C[C@@](Cc3c2c(c4c(c3O)C(=O)c5cccc(c5C4=O)OC)O)(C(=O)CO)O)N)O Doxorubicin | Doxorubicin              | COc1cccc2c(O)c3c(O)c4c(c(O)c3c(O)c12)=C(OC1CC(N)C(O)C(C)O1)CC(O)(C(=O)CO)C=4 | Non-substrate  | 0.7          | Non-substrate  | 0.7          | Non-substrate  | 0.68         | Non-substrate  | 0.68         | Non-substrate  | 0.7          | Non-substrate   | 0.7           | Non-substrate  | 0.7          | Non-substrate  | 0.68         | Non-substrate  | 0.7          |                                                    
    | best_performance | O=S(=O)(N)c1c(Cl)cc2c(c1)S(=O)(=O)NCN2 Hydrochlorothiazide                                                    | Hydrochlorothiazide      | NS(=O)(=O)c1cc2c(cc1Cl)NCNS2(=O)=O                                           | Non-substrate  | 0.66         | Non-substrate  | 0.65         | No prediction  | 0.66         | No prediction  | 0.66         | No prediction  | 0.66         | No prediction   | 0.66          | Non-substrate  | 0.66         | Non-substrate  | 0.66         | No prediction  | 0.66         |                                                    
    | best_performance | C[C@H]1COc2c3n1cc(c(=O)c3cc(c2N4CCN(CC4)C)F)C(=O)O Levofloxacin                                               | Levofloxacin             | CC1COc2c(N3CCN(C)CC3)c(F)cc3c(=O)c(C(=O)O)cn1c23                             | No prediction  | 0.91         | Non-substrate  | 0.73         | Non-substrate  | 0.91         | No prediction  | 0.91         | Non-substrate  | 0.91         | No prediction   | 0.91          | No prediction  | 0.91         | Non-substrate  | 0.91         | No prediction  | 0.91         |                                                    
    | best_performance | CC1=C(C(=O)N(N1C)C2=CC=CC=C2)N(C)CS(=O)(=O)[O-].O.[Na+] Metamizole (Sulpyrine)                                | Metamizole (Sulpyrine)   | Cc1c(N(C)CS(=O)(=O)O)c(=O)n(-c2ccccc2)n1C                                    | Non-substrate  | 0.64         | Non-substrate  | 0.64         | No prediction  | 0.64         | No prediction  | 0.64         | No prediction  | 0.64         | No prediction   | 0.64          | No prediction  | 0.64         | Non-substrate  | 0.64         | No prediction  | 0.64         |                                                    
    | best_performance | CC1=C(C(C(=C(N1C=O)C)C(=O)OC)C2=CC=CC=C2[N+](=O)[O-])C(=O)OC Nifedipine                                       | Nifedipine               | COC(=O)C1=C(C)N(C=O)C(C)=C(C(=O)OC)C1c1ccccc1[N+](=O)[O-]                    | Non-substrate  | 0.9          | No prediction  | 0.87         | Non-substrate  | 0.9          | Non-substrate  | 0.9          | Non-substrate  | 0.87         | Non-substrate   | 0.9           | No prediction  | 0.9          | Non-substrate  | 0.9          | Substrate      | 0.9          |                                                    
    | best_performance | OC=1c3ccccc3OC(=O)C=1C(CC)c2ccccc2 Phenprocoumon                                                              | Phenprocoumon            | CCC(c1ccccc1)c1c(O)c2ccccc2oc1=O                                             | No prediction  | 1            | Non-substrate  | 1            | No prediction  | 1            | Substrate      | 1            | Substrate      | 1            | Substrate       | 1             | No prediction  | 0.84         | Non-substrate  | 1            | Substrate      | 1            |                                                    
    | best_performance | O=C1COCCN1c2ccc(cc2)N3C[C@@H](OC3=O)CNC(=O)c4ccc(s4)Cl Rivaroxaban                                            | Rivaroxaban              | O=C(NCC1CN(c2ccc(N3CCOCC3=O)cc2)C(=O)O1)c1ccc(Cl)s1                          | Non-substrate  | 0.67         | Non-substrate  | 0.67         | Non-substrate  | 0.66         | No prediction  | 0.67         | No prediction  | 0.67         | No prediction   | 0.67          | No prediction  | 0.67         | Non-substrate  | 0.67         | Substrate      | 0.66         |
    | best_performance | CCOC(=O)N1CCN(CC1)C2=C(C(=O)C2=O)N3CCN(CC3)C4=CC=C(C=C4)OC Website example                                    | Website example          | CCOC(=O)N1CCN(c2c(N3CCN(c4ccc(OC)cc4)CC3)c(=O)c2=O)CC1                       | No prediction  | 0.73         | Non-substrate  | 0.73         | Non-substrate  | 0.73         | Non-substrate  | 0.73         | No prediction  | 0.71         | No prediction   | 0.73          | No prediction  | 0.73         | Non-substrate  | 0.71         | No prediction  | 0.71         |


