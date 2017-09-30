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

;%DLANCE2^INT^1^59547,73867^0
DLANCE2(LANC) 
 
 
 
 
 N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MENU,OR,REFUSE,RETOUR
 N REF,AD,CTR,U,GLO,REP,LIEN,TABI,MODEX,DD,DO,ART,GAM,QUANT,STAD,STAT
 N PREMG,ATMAC,ATDEL,ATDATJAL,ATCHAR,TT,ORDR,ATDUJAL
 D CLEPAG^%VVIDEO
 D ^%VZEATT,MENU("MENU")
 
 S (CMS,ABENDSCR)=0,%AJM="C",NOMTAB=""
 S REP=$$LAN^%DLCON2
 D INILAN(LANC)
 S GLODAT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(GLODAT)
 D MVG^%QSCALVA(REP,LANC,ATDATJAL,GLODAT,.TT)
 D POCLEPA^%VVIDEO
CMS1 
 D EFF
 F U=1:1:^%SCRE(SCR) S PATOUCH(U)=1
 S PATOUCH(1)=0
 D ^%VMODISC
 G:ABENDSCR FIN
 S PREMG=RESUL(1)-1
 I $$CHERCH(PREMG,1)=0 D RET G CMS1
 D AFF
DIAL2 D POCLEPA^%VVIDEO,^%VQUIKMN(0,79,23,"MENU",.AD,.CTR)
 G:CTR="F" FIN
 I CTR="A" G CMS1
 I CTR="R" D REAFF
 G:AD'="" @AD
 G DIAL2
 
FIN K @(GLODAT)
 Q
 
PLUS I $$CHERCH($S(ORDR(2)="":ORDR(1),1:ORDR(2)),1) D AFF G DIAL2
 D RET G DIAL2
 
MOINS I $$CHERCH(ORDR(1),-1) D AFF G DIAL2
 D RET G DIAL2
 
 
MENU(MN) 
 K @(MN)
 S @MN@(1)=$$^%QZCHW("+")_"^PLUS"
 S @MN@(2)=$$^%QZCHW("-")_"^MOINS"
 Q
 
RET D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) Q
 
CHERCH(GROUP,SENS) 
 N PREM,SECO
 G:SENS=-1 CHERMOI
 S PREM=$O(@GLODAT@(GROUP))
 Q:PREM="" 0
 D INIGRI
 D AFFGR(PREM,1)
 S ORDR(1)=PREM
 S PREM=$O(@GLODAT@(PREM))
 S ORDR(2)=PREM
 Q:PREM="" 1
 D AFFGR(PREM,9)
 Q 1
CHERMOI S SECO=$ZP(@GLODAT@(GROUP))
 Q:SECO="" 0
 D INIGRI
 S PREM=$ZP(@GLODAT@(SECO))
 I PREM="" D AFFGR(SECO,1) S ORDR(1)=SECO,ORDR(2)="",GROUP=SECO Q 1
 D AFFGR(PREM,1),AFFGR(SECO,9)
 S ORDR(1)=PREM,ORDR(2)=SECO
 Q 1
 
AFFGR(GR,IND) 
 N OPAR,DAT
 S RESUL(IND)=GR
 
 S OPAR=$S($$OAIR^%QSGE5(REP,LANC,"OPERATION",GR):$$VALEUR^%QSGE5(REP,LANC,"OPERATION",GR),1:"")
 
 S:OPAR="" OPAR=$S($$OAIR^%QSGE5(REP,LANC,"ARTICLE.JALONNE",GR):$$VALEUR^%QSGE5(REP,LANC,"ARTICLE.JALONNE",GR),1:"")
 S RESUL(IND+1)=OPAR
 
 S RESUL(IND+2)=$S($$OAIR^%QSGE5(REP,LANC,"PROFONDEUR",GR):$$VALEUR^%QSGE5(REP,LANC,"PROFONDEUR",GR),1:"")
 
 S RESUL(IND+3)=$S($$OAIR^%QSGE5(REP,LANC,"NUMERO.OPERATION",GR):$$VALEUR^%QSGE5(REP,LANC,"NUMERO.OPERATION",GR),1:"")
 
 S RESUL(IND+4)=$S($$OAIR^%QSGE5(REP,LANC,ATCHAR,GR):$$VALEUR^%QSGE5(REP,LANC,ATCHAR,GR),1:"")
 
 S RESUL(IND+5)=$S($$OAIR^%QSGE5(REP,LANC,ATMAC,GR):$$VALEUR^%QSGE5(REP,LANC,ATMAC,GR),1:"")
 
 S RESUL(IND+7)=$S($$OAIR^%QSGE5(REP,LANC,ATDUJAL,GR):$$VALEUR^%QSGE5(REP,LANC,ATUJAL,GR),1:"")
 
 S DAT=$S($$OAIR^%QSGE5(REP,LANC,ATDATJAL,GR):$$VALEUR^%QSGE5(REP,LANC,ATDATJAL,GR),1:"")
 Q:DAT=""
 S DAT=$$AFFI^%QMDAUC(REP,ATDATJAL,DAT)
 S RESUL(IND+6)=DAT
 Q
 
AFF 
 D ^%VAFIGRI,^%VAFISCR
 D NORM^%VVIDEO Q
 
REAFF 
 S SCR="DLANRES1"
 D AFF
 S SCR="DLANRES2"
 D AFF
 Q
 
EFF S SCR="DLANRES1"
 F I=1:1:^%SCRE(SCR) S RESUL(I)=""
 S RESUL(1)=LANC,RESUL(2)=ART,RESUL(3)=GAM
 S RESUL(4)=DD,RESUL(6)=QUANT,RESUL(5)=DO
 S RESUL(7)=STAT,RESUL(8)=STAD
 D AFF
 S SCR="DLANRES2"
 F I=1:1:^%SCRE(SCR) S RESUL(I)=""
 D AFF
 Q
 
INIGRI 
 S SCR="DLANRES2"
 F I=1:1:^%SCRE(SCR) S RESUL(I)=""
 Q
 
INILAN(LANC) 
 S ART=$$^%QSCALVA(REP,LANC,"ARTICLE.LANCE")
 S ATMAC=$$MACHINE^%DLCON2,ATDEL=$$DELAI^%DLCON2
 S ATDUJAL=$$DUJAL^%DLCON2
 S ATDATJAL=$$DATEJAL^%DLCON2,ATCHAR=$$CHARGAR^%DLCON2
 S DD=$$^%QSCALVA(REP,LANC,ATDEL)
 S DD=$$AFFI^%QMDAUC(REP,ATDEL,DD)
 S DO=$$^%QSCALVA(REP,LANC,"DELAI.OBTENU")
 S DO=$$AFFI^%QMDAUC(REP,"DELAI.OBTENU",DO)
 S GAM=$$^%QSCALVA(REP,LANC,"GAMME")
 S QUANT=$$^%QSCALVA(REP,LANC,"QUANTITE")
 S STAD=$$^%QSCALVA(REP,LANC,"STADE")
 S STAT=$$^%QSCALVA(REP,LANC,"STATUT")
 Q

