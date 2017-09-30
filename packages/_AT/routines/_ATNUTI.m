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

;%ATNUTI^INT^1^59547,73866^0
%ATNUTI ;;09:37 AM  23 Nov 1992; 05 Nov 92  4:22 PM ; 09 Dec 92 11:01 AM
 
 
 
 
 
 
 
EMP2 
 N TRT,QUI,WHOIS,REP,IND
 K ^PARAENT($J,%VNGA)
EMP22 D CLEPAG^%VVIDEO
 W !,!,!,"  A T N   M P 2 (moteur procedural, 2eme version) ",!
 W !,"nom du traitement a activer : " R TRT
 S ^PARAENT($J,%VNGA,"TRT")=TRT
 W !,"repertoire de l'individu : " R REP
 S ^PARAENT($J,%VNGA,"REP")=REP
 W !,"nom de l'individu : " R IND
 S ^PARAENT($J,%VNGA,"IND")=IND
 W !,"QUI : " R QUI
 S ^PARAENT($J,%VNGA,"QUI")=QUI
 W !,"WHOIS : " R WHOIS
 S ^PARAENT($J,%VNGA,"WHOIS")=WHOIS
 W !,!,!
 I '($$CONFIRM) G EMP22
 Q
 
 
 
 
ETLINTER 
 N TRT,QUI,WHOIS,REP,IND
 K ^PARAENT($J,%VNGA)
ETLINT2 D CLEPAG^%VVIDEO
 W !,!,!,"  A T N   T L I N T E R (activation sur une liste) ",!
 W !,"nom du traitement a activer : " R TRT
 S ^PARAENT($J,%VNGA,"TRT")=TRT
 W !,"liste a traiter : " R LISTE
 S ^PARAENT($J,%VNGA,"LISTE")=LISTE
 W !,"QUI : " R QUI
 S ^PARAENT($J,%VNGA,"QUI")=QUI
 W !,"WHOIS : " R WHOIS
 S ^PARAENT($J,%VNGA,"WHOIS")=WHOIS
 W !,!,!
 I '($$CONFIRM) G ETLINT2
 Q
 
 
 
 
ECOMPATN 
 N ATN,AVERECUS,QUI,CORPS
 K ^PARAENT($J,%VNGA)
ECOMP2 D CLEPAG^%VVIDEO
 W !,!,!,"  A T N   C O M P A T N (compilation d'atn) ",!
 W !,"nom de l'atn a compiler : " R ATN
 S ^PARAENT($J,%VNGA,"NOMATN")=ATN
 W !,"corps des routines a creer ( ""xw""_CORPS_NUM) : " R CORPS
 S ^PARAENT($J,%VNGA,"CORPS")=CORPS
 W !,"cet ATN recuse-t-il (0/1) : " R AVERECUS
 S ^PARAENT($J,%VNGA,"AVERECUS")=AVERECUS
 W !,"La version compilee doit-elle s'executer avec affichage (0/1) : " R AVEAFFI
 S ^PARAENT($J,%VNGA,"AVEAFFI")=AVEAFFI
 W !,"QUI : " R QUI
 S ^PARAENT($J,%VNGA,"QUI")=QUI
 W !,!,!
 I '($$CONFIRM) G ECOMP2
 Q
 
SCOMPATN 
 D CLEPAG^%VVIDEO
 W !,!,!,^PARASOR($J,%VNGA,"NBROUT")_" routines"
 D ^%VZEAVT("")
 Q
 
 
 
 
EFACT2 N ENT
 K ^PARAENT($J,%VNGA)
EFACT22 D CLEPAG^%VVIDEO
 W !,!,!,"  A T N   F A C T O R I E L L E ",!
 W !,"entier dont il faut calculer la factorielle : " R ENT
 S ^PARAENT($J,%VNGA,"ENT")=ENT
 W !,!,!
 I '($$CONFIRM) G EFACT22
 Q
SFACT2 D CLEPAG^%VVIDEO
 W !,!,!," resultat : "_^PARASOR($J,%VNGA,"RES")
 D ^%VZEAVT("")
 Q
 
 
 
EANALEX N CHAINE
 K ^PARAENT($J,%VNGA)
EANA2 D CLEPAG^%VVIDEO
 W !,!,!,"  A T N   A N A L E X ",!
 W !,"chaine a traduire : " R CHAINE
 S ^PARAENT($J,%VNGA,"CHAINE")=CHAINE
 W !,!,!
 I '($$CONFIRM) G EANA2
 Q
SANALEX N I
 D CLEPAG^%VVIDEO
 W !," chaine "_^PARAENT($J,%VNGA,"CHAINE")_" "_$S(^PARASOR($J,%VNGA,"OKLEX"):"",1:"in")_"correcte"
 F I=1:1:^PARASOR($J,%VNGA,"SKEL") W !,^PARASOR($J,%VNGA,"SKEL",I),"  ",^PARASOR($J,%VNGA,"TRAD",I)
 D ^%VZEAVT("")
 Q
 
CONFIRM() 
 W !,"Ces parametres sont-ils corrects ? (O/N)" R REP
 Q $E(REP)="O"
 
 
 
ETHEVEA 
 N REP,IND
 K ^PARAENT($J,%VNGA)
ETHEVEA2 D CLEPAG^%VVIDEO
 K REP,IND
 I '($$CARGEN^%QMEXPAR(%VNE(%VNGA,1),.REP,.IND)) G ETHEVEA2
 S ^PARAENT($J,%VNGA,"REPFOC")=REP
 S ^PARAENT($J,%VNGA,"INDFOC")=IND
 Q
 
 
 
 
 
 D ACTAFF^%QMEAACT("SAISIE.I",SAIS,0,0,78,10,0,11,78,11,BASE,IND,"$$AFFICH^%QMEAROU","AFFECT^%QMEAROU")
 D CLEPAG^%VVIDEO
 
 
VERLENT 
 N CHAINE
 K ^PARAENT($J,%VNGA)
EVER D CLEPAG^%VVIDEO
 W !,!,!,"  A T N   V E R L A N ",!
 W !,"chaine a traduire : " R CHAINE
 S ^PARAENT($J,%VNGA)=CHAINE
 W !,!,!
 I '($$CONFIRM) G EVER
 Q
VERLSOR N I
 D CLEPAG^%VVIDEO
 W !," chaine "_^PARAENT($J,%VNGA)
 W " --> ",^PARASOR($J,%VNGA)
 D ^%VZEAVT("")
 Q
 
MAJ S ATN=""
MAJBCL S ATN=$O(^[QUI]RQSGLO("ATN",ATN)) Q:ATN=""
 W !,ATN
 G:'($D(^[QUI]RQSGLO("ATN",ATN,"E"))) MAJBCL
 S ROU=^[QUI]RQSGLO("ATN",ATN,"E")
 W "   "_ROU
 G:ROU="ETHEVEA^xatnuti" MAJHEV
 G:ROU="ETHEVEA^%ATNUTI" MAJHEV
 G:ROU="ECOMPATN^%ATNUTI" MAJCOMP
 G MAJBCL
 
MAJHEV W "  ( hevea ) "
 K ^[QUI]RQSGLO("ATN",ATN,"ENT")
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",1)="REPFOC"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",1,"COM")="Repertoire focus :"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",2)="INDFOC"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",2,"COM")="Individu focus :"
 G MAJBCL
MAJCOMP 
 W "  ( compil ) "
 K ^[QUI]RQSGLO("ATN",ATN,"ENT")
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",1)="NOMATN"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",1,"COM")="Nom de l'ATN a compiler"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",2)="CORPS"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",2,"COM")="Corps des routines a creer ( ""xw""_CORPS_NUM) : "
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",3)="AVERECUS"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",3,"COM")="cet ATN recuse-t-il (0/1) : "
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",4)="AVEAFFI"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",4,"COM")="La version compilee doit-elle s'executer avec affichage (0/1) : "
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",5)="QUI"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",5,"COMM")="QUI : "
 G MAJBCL
MAJ3 G:^[QUI]RQSGLO("ATN",ATN,"E")'="EANALEX^%ATNUTI" MAJ4
 W "  ( analex ) "
 K ^[QUI]RQSGLO("ATN",ATN,"ENT")
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",1)="CHAINE"
 S ^[QUI]RQSGLO("ATN",ATN,"ENT",1,"COM")="Chaine a traduire : "
 G MAJBCL
MAJ4 G MAJBCL
 
 
ENTSTD(%VNGA,ATN) 
 N VAR,COM,VAL,IVAR
 Q:'($D(^[QUI]RQSGLO("ATN",ATN,"ENT")))
 D CLEPAG^%VVIDEO
 S IVAR=""
NXVAR S IVAR=$O(^[QUI]RQSGLO("ATN",ATN,"ENT",IVAR)) Q:IVAR=""
 S VAR=^[QUI]RQSGLO("ATN",ATN,"ENT",IVAR)
 S COM=$S($D(^[QUI]RQSGLO("ATN",ATN,"ENT",IVAR,"COM")):^[QUI]RQSGLO("ATN",ATN,"ENT",IVAR,"COM"),1:"Donnez la valeur de la variable "_VAR)
 W !,COM
 R VAL
 S ^PARAENT($J,%VNGA,VAR)=VAL
 G NXVAR

