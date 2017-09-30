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
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QULELN^INT^1^59753,84076^0
%QULELN ;;03:33 PM  31 May 1991
 
 
 N TAB
 S (TAB("BASE"),TAB("DIAL"),TAB("CONF"))=0
 D AUTO("TAB")
 Q
 
AUTO(GLODEF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N REPE,REP,LIEN,RAC,TEMP,DIAL,GRAC,CONFIG,EMPIL,INDVD
 N RAC,TEMP,GRAP,UCONT,TGR,CONF,TRANSL,ORDO,LARAF,TITRE
 S EMPIL=$$GET^%SGVAR("NIVEDL")+1
 D SET^%SGVAR("NIVEDL",EMPIL)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DRV"_EMPIL) K @(TEMP)
 S DIAL=$$CONCAS^%QZCHAD(TEMP,"D"),GRAC=$$CONCAS^%QZCHAD(TEMP,"R")
 S GRAP=$$CONCAS^%QZCHAD(TEMP,"G"),UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S CONF=$$CONCAS^%QZCHAD(TEMP,"C"),TRANSL=$$CONCAS^%QZCHAD(TEMP,"T")
 
 
 I '(@GLODEF@("BASE")) D GETTRIPL^%QULELN1(.REPE,.LIEN,GRAC) G DIAL
 S REPE=@GLODEF@("BASE","B"),LIEN=@GLODEF@("BASE","L")
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD($$CONCAS^%QZCHAD(GLODEF,"BASE"),"R"),GRAC)
 
DIAL G:(REPE="")!(LIEN="") FINDRV
 S REP=$$NOMINT^%QSF(REPE)
 
 
 
 I '(@GLODEF@("DIAL")) D GETDIAL^%QULELN2(REP,LIEN,DIAL) G CONF
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(GLODEF,"DIAL"),DIAL)
 
CONF 
 I '(@GLODEF@("CONF")) D GETCONF^%QULELN3(.CONFIG) G SUITE
 S CONFIG=@GLODEF@("CONF","CF")
SUITE D CLEPAG^%VVIDEO,^%VZEATT
 D LOADCONF^%QULELN3(CONFIG,CONF,.LARAF)
 
 
 S ORDO=$P(@GRAC,"^",3)
 D MAKEGRA^%QULELN0
 D MAKEUC,OFF^%VZEATT
 S TITRE="1"_$C(0)_"2"_$C(0)_$$^%QZCHW("Repertoire ")_$C(0)_1_$C(0)_13_$C(0)_$$NOMLOG^%QSF(REP)_$C(0)
 S TGR(1)=$P(@GRAC,"^"),TGR(2)=$P(@GRAC,"^",2)
 S TITRE=TITRE_"1"_$C(0)_"40"_$C(0)_$S(TGR(1)="REP":$$^%QZCHW("Tous les individus"),TGR(1)="IND":$$^%QZCHW("Individu ")_TGR(2),1:$$^%QZCHW("Individus de la liste ")_TGR(2))
 S TITRE=TITRE_$C(0)_"2"_$C(0)_"2"_$C(0)_"Niveau "_EMPIL_$C(0)_"2"_$C(0)_"30"_$C(0)_$$^%QZCHW("Lien ")_LIEN
 D ^%QULELU(GRAP,GRAC,LARAF,3,UCONT,TITRE)
FINDRV K @(TEMP)
 D DEP^%SGVAR("NIVEDL")
 Q
 
MAKEUC 
 N %AA
 
 S @UCONT@("AUTRE",1)="CTRB^%QULELNU",@UCONT@("AUTRE",1,"TXT")=$$^%QZCHW("Acces individu"),@UCONT@("AUTRE",1,"COM")=$$^%QZCHW("Visualisation des attributs de l'individu"),@UCONT@("AUTRE",1,"CTR")="B"
 S %AA=2
 
 S:$$QUAL^%QSGEL2(REP,LIEN) @UCONT@("AUTRE",2)="CTRV^%QULELNU",@UCONT@("AUTRE",2,"TXT")=$$^%QZCHW("Acces lien"),@UCONT@("AUTRE",2,"COM")=$$^%QZCHW("Visualisation des attributs de l'individu lien"),@UCONT@("AUTRE",2,"CTR")="V",%AA=%AA+1
 S:$$TYPEL^%QSGES90(LIEN)'<3 @UCONT@("AUTRE",%AA)="INDIV^%QULELNU",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Lier"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Ajout d'une liaison a l'individu courant"),@UCONT@("AUTRE",%AA,"CTR")="I",%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="TRAITER^%QULELNU",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Traiter"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Activation d'un traitement sur l'individu courant"),@UCONT@("AUTRE",%AA,"CTR")="T",%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="SUIVRE^%QULELNU",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Editer"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Rappel de ce meme editeur sur un autre lien"),@UCONT@("AUTRE",%AA,"CTR")="E",%AA=%AA+1
 S @UCONT@("AFF")="$$ABRV^%QULELNU",@UCONT@("INFO")="$$INFO^%QULELNU",@UCONT@("FULL")="$$FULL^%QULELNU"
 S:$$TYPEL^%QSGES90(LIEN)'<3 @UCONT@("CUT")="CUT^%QULELNU"
 S:$$TYPEL^%QSGES90(LIEN)'<3 @UCONT@("PASTE")="PASTE^%QULELNU"
 Q
 
 
TEST 
 N TAB
 S TAB("BASE")=1,TAB("DIAL")=0,TAB("CONF")=0
 S TAB("BASE","B")="ARTICLE",TAB("BASE","L")="COMPOSE.DE"
 S TAB("BASE","R")="IND^1^0",TAB("BASE","R",1)=""
 D AUTO("TAB")
 Q

