;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     : RPCFNCT                                                      !
;! Module      : RPC (remote procedure call)                                  !
;! But         : Regroupe les commandes liées aux bases de données.           !
;!                                                                            !
;! Description :                                                              !
 ;
 ; Regroupe les commandes liées aux bases de données.
 ;
 ; Paramètre d'entrée
 ; ==================
 ; QUI  - Nom de la base de données utilisateur
 ; %U7  - Nom du répertoire dans le shéma de données
 ; %CUK - Nom de l'individu dans le répertoire
 ; %UP  - Nom de l'attribut de l'individu
 ; %UV  - Valeur à affecter à ATTRIBUT(INDICE)
 ; %UN  - Nom de l'indice de l'atribut
 ;
 ; Valeur de sortie
 ; ================
 ; MES - Retour égale à 1 si la commande s'est correctement exécutée
 ;       ou retour égale à une chaîne de caractère contenant un message
 ;       expliquant pourquoi la commande n'a pas été exécutée
 ;
 ; Convention
 ; ==========
 ; Si la commande existe sous Mumps, la règle est de caller au mode standard
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

RPCBDDC ;
 ;
SET(RET,QUI,%U7,%CUK,%UP,%UV,%UN) ;vous n'avez pas le droit de supprimer cet attribut********** %QMDAUC
 ; 
 ;SET affecte une valeur à l'attribut d'un individu.
 ; test : view "LINK":"RECURSIVE" zl "RPCBDDC" zl "_QSGESTI" d SET^RPCBDDC(.RET,"DMO","BAC.A.SABLE","DEFAUT","DESCRIPTION","TEST",1) W "-----RET=",RET,!
 ;
 I $$ZDIRECTORY^%GTM(QUI)'=1 Q "La base "_QUI_" de données utilisateur n'existe pas."
 S WHOIS=QUI,WHOIS("ETUDE")=0,NUL=$$ZDIRECTORY^%GTM(QUI) d PA^%QSGESTI(%U7,%CUK,%UP,%UV,%UN)
 S RET=1
 Q

KILL(RET,QUI,%U7,%CUK,%UP,%UV,%UN) ;vous n'avez pas le droit de supprimer cet attribut********** %QMDAUC
 ; 
 ;KILL supprime une valeur d'un attribut d'un individu.
 ; test : view "LINK":"RECURSIVE" zl "RPCBDDC" zl "_QSGESTI" d KILL^RPCBDDC(.RET,"DMO","BAC.A.SABLE","DEFAUT","DESCRIPTION","TEST",1) W "-----RET=",RET,!
 ;
 I $$ZDIRECTORY^%GTM(QUI)'=1 Q "La base "_QUI_" de données utilisateur n'existe pas."
 ; Supprime tous les indices d'un attribut
 I %UN="" S WHOIS=QUI,WHOIS("ETUDE")=0,NUL=$$ZDIRECTORY^%GTM(QUI) d SAH^%QSGESTI(%U7,%CUK,%UP) Q
 ; Supprime un indice d'un attribut
 S WHOIS=QUI,WHOIS("ETUDE")=0,NUL=$$ZDIRECTORY^%GTM(QUI) d PS^%QSGESTI(%U7,%CUK,%UP,%UV,%UN)
 S RET=1
 Q

READ(RET,QUI,%U7,%CUK,%UP,%UN)
 ; 
 ;READ lit une valeur de l'attribut d'un individu.
 ; test : view "LINK":"RECURSIVE" zl "RPCBDDC" zl "_QSGESTI" d READ^RPCBDDC(.RET,"DMO","BAC.A.SABLE","DEFAUT","DESCRIPTION",1) W "-----RET=",RET,!
 ;
 I $$ZDIRECTORY^%GTM(QUI)'=1 Q "La base "_QUI_" de données utilisateur n'existe pas."
 ;S WHOIS=QUI,WHOIS("ETUDE")=0,NUL=$$ZDIRECTORY^%GTM(QUI) d SAH^%QSGESTI(%U7,%CUK,%UP)

 I '($D(^[QUI]QUERYV(%U7,%CUK,%UP,%UN))) S RET="" Q
 S RET=^[QUI]QUERYV(%U7,%CUK,%UP,%UN)
 Q

TEST()
 ;Pour tester :
 ;view "LINK":"RECURSIVE" zl "RPCBDDC" w $$TEST^RPCBDDC() w !!! zwr ^TMP
 ;
 k ^TMP
 s ^TMP($j,"name")="RPCBDD EXECUTER COMMANDE SET"
 s ^TMP($j,"input",1,"value")="DMO"
 s ^TMP($j,"input",2,"value")="BAC.A.SABLE"
 s ^TMP($j,"input",3,"value")="DEFAUT"
 s ^TMP($j,"input",4,"value")="DESCRIPTION"
 s ^TMP($j,"input",5,"value")="TEST"
 s ^TMP($j,"input",6,"value")="1"
 s ok=$$RPCEXECUTE^gtmYRexpertRPC("^TMP($j)")
 QUIT ok

TEST2()
 ;Pour tester :
 ;view "LINK":"RECURSIVE" zl "RPCBDDC" w $$TEST2^RPCBDDC() w !!! zwr ^TMP
 ;
 k ^TMP
 s ^TMP($j,"name")="RPCBDD EXECUTER COMMANDE KILL"
 s ^TMP($j,"input",1,"value")="DMO"
 s ^TMP($j,"input",2,"value")="BAC.A.SABLE"
 s ^TMP($j,"input",3,"value")="DEFAUT"
 s ^TMP($j,"input",4,"value")="DESCRIPTION"
 s ^TMP($j,"input",5,"value")="TEST"
 s ^TMP($j,"input",6,"value")="1"
 s ok=$$RPCEXECUTE^gtmYRexpertRPC("^TMP($j)")
 QUIT ok

TEST3()
 ;Pour tester :
 ;view "LINK":"RECURSIVE" zl "RPCBDDC" w $$TEST^RPCBDDC() w !!! zwr ^TMP
 ;
 k ^TMP
 s ^TMP($j,"name")="RPCBDD EXECUTER COMMANDE READ"
 s ^TMP($j,"input",1,"type")="LITERAL"
 s ^TMP($j,"input",1,"value")="DMO"
 s ^TMP($j,"input",2,"type")="LITERAL"
 s ^TMP($j,"input",2,"value")="BAC.A.SABLE"
 s ^TMP($j,"input",3,"type")="LITERAL"
 s ^TMP($j,"input",3,"value")="DEFAUT"
 s ^TMP($j,"input",4,"type")="LITERAL"
 s ^TMP($j,"input",4,"value")="DESCRIPTION"
 s ^TMP($j,"input",5,"type")="LITERAL"
 s ^TMP($j,"input",5,"value")="1"
 s ok=$$RPCEXECUTE^gtmYRexpertRPC("^TMP($j)")
 QUIT ok


