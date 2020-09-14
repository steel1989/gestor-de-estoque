<?php
session_start();

if (isset($_POST["deletar"])) 
                                    {

                                      if (empty($_POST["deletecheck"])) 
                                      {
                                        echo "<h1>Ups! Você ainda não selecionou os produtos.</h1>";
                                      }

                                        else
                                        {
                                           foreach ($_POST["deletecheck"] as $id_services)
                                            {
                                             $sql3="delete from service where id_service='$id_services'";
                                              $bd->consulta($sql3);
                                              {
                                                echo "<h1>Ótimo! Produtos corretamente excluídos.</h1>";
                                                 
                                              }
                                            }
                                           }
                                        }
                                        ?>

                                        <input type="submit" name="Voltar" value="Voltar ao estoque" class="dt-button buttons-pdf buttons-html5 btn blue btn-outline" onclick="history.back()" href="/productos">
