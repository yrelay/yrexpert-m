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

;%QGPROG2^INT^1^59547,73876^0
%QGPROG2(LISTE,LISTATT,ATTTOL) ;;06:55 PM  7 Jun 1993; ; 04 Nov 92  3:37 PM
 
 
 
 
 
 
 
 
 N CH,NOMS,NUFA,RES1,RES2,RES3,RES4,RES5,RES6,SCR,U,LATT
 S LATT=$S($$EX^%QMLILA(LISTATT):"^[QUI]ZLILA("""_LISTATT_""")",1:$$TEMP^%SGUTIL)
 D CADRE^%QGSELIS
 
 D LISTE,MKRES,GRILLE,TRI,INIT,GO
 Q 1
 
 
GRILLE S GRAT="" F NA=1:1:5 S RTTA=$S($D(@LATT@(NA)):@LATT@(NA),1:""),^ATTR($J,"O",NA)=RTTA,GRAT=GRAT_RTTA_"^"
 S RTTA=ATTTOL,^ATTR($J,"O",6)=RTTA,GRAT=GRAT_RTTA_"^"
 S ^[QUI]GRATT(NUFA)=GRAT K GRAT,NA S ^ATTR($J,"O",0)="AFFECTATION"
 I ATTTOL="" S ATAFG="CARDINAL"
 E  S ATTR=ATTTOL,ATAFG="SOMME.DES."_ATTTOL
 S (^[QUI]GRATT(NUFA,"G",ATAFG),^[QUI]GRATT(NUFA,"G","CARDINAL"))=""
 Q
 
 
INIT S NUFA=$J,NOUVATT=1,NOUVETU=1
 S @GROUPE@(1)=""
 S NOMS="^INDIVIDU^INDIVIDUS^M^LOT^LOTS^M"
 S (%NIND,%nind)=$P(NOMS,"^",2),(%NINDS,%ninds)=$P(NOMS,"^",3),(%NGRO,%ngro)=$P(NOMS,"^",5),(%NGROS,%ngros)=$P(NOMS,"^",6),(%EI,%ei)=$S($P(NOMS,"^",4)="F":"E",1:""),%EG=$S($P(NOMS,"^",7)="F":"E",1:""),%eg=$S(%EG="E":"e",1:"")
 K NOMS
 Q
 
LISTE 
 N CARD,IND,U,BASE S NUFA=$J
 D MSG^%VZEATT("Constitution de la liste initiale...")
 S CARD=0,LI=-1 F U=0:0 S LI=$N(@LISTE@(LI)) Q:LI=-1  S AD=$$^%QSCALVA("L0",LI,"ADRESSE"),BASE=$$^%QSCALVA("L0",LI,"BASE") I BASE'="" S IND=-1 F U=0:0 S IND=$N(@AD@(IND)) Q:IND=-1  I $$IR^%QSGE5(BASE,IND) D PARIND
 S @GROUPE@("CARD")=CARD
 Q
PARIND S @GRLISTE@(IND)=BASE,CARD=CARD+1
 S @GRLISTE@(IND,"NB")=$S($$OAIR^%QSGE5("L0",LI,"QUANTITE",IND):$$VALEUR^%QSTRUC8("L0",LI,"QUANTITE",IND),1:1)
 Q
 
TRI D ^%QGTRILI,POCLEPA^%VVIDEO
 Q
 
MKRES N GRO,%G,IND,TOTGR,QTE
 S GRO="" F %G=0:0 S GRO=$$SUIVL^%QS0XG1(LISRES,GRO) Q:GRO=""  D MKGRO
 Q
MKGRO S IND="",TOTGR=0,@GROUPE@(1,GRO)=""
INDN S IND=$$SUIVL^%QS0XG1(GRO,IND) I IND="" S @GROUPE@(1,GRO,"CARD")=TOTGR Q
 G:'($D(@GRLISTE@(IND))) INDN
 S QTE=$$^%QSCALIN("L0",GRO,"QUANTITE",IND) S:QTE="" QTE=1
 S @GROAFF@(IND)=$S($D(@GROAFF@(IND)):@GROAFF@(IND)+QTE,1:QTE)
 S @GROAFF@(IND,GRO)=$S($D(@GROAFF@(IND,GRO)):@GROAFF@(IND,GRO)+QTE,1:QTE)
 S TOTGR=TOTGR+QTE
 S @GROUPE@(1,GRO,"OBJET",IND)=""
 G INDN
 
GO 
 S ZOOM=0,ATAF=1,ARRET="FIN",COTE="",AFFLIST=1 K ^PAG($J),^PAD($J) D CLEPAG^%VVIDEO,ENTETE^%QGECRAN,CADRE^%QGECRAN,CREPAG^%QGPAG,APG^%QGPAG,CREPAD^%QGPAG,TOUT^%QGEVASG,APD^%QGPAG
 S (CTRLF,CTRLA)=0 Q
 ;

