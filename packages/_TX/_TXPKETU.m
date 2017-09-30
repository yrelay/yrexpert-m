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

;%TXPKETU^INT^1^59547,74032^0
%TXPKETU ;;12:53 PM  23 Mar 1993; ; 23 Mar 93  2:12 PM
 
 
 N MN,ADRES,CONTR
 N TEMP,GET,ET,%ET,VAL,LSEL,UCONT
 S UCONT=$$TEMP^%SGUTIL
 S MN=$$TEMP^%SGUTIL,TEMP=$$TEMP^%SGUTIL,LSEL=$$TEMP^%SGUTIL
 D ON^%VZEATT
 S ET="" F %ET=0:0 S ET=$O(^[QUI]RQSDON("TPK",ET)) Q:ET=""  D LIGNE
 G SUI
LIGNE 
 S VAL=ET_"  "_^[QUI]RQSDON("TPK",ET,"Date debut")_"  "_^[QUI]RQSDON("TPK",ET,"Heure debut")
 S VAL=VAL_" de la periode "_$S($D(^[QUI]RQSDON("TPK",ET,"Periode debut")):^[QUI]RQSDON("TPK",ET,"Periode debut"),1:" ")
 S VAL=VAL_" a la periode "_$S($D(^[QUI]RQSDON("TPK",ET,"Periode fin")):^[QUI]RQSDON("TPK",ET,"Periode fin"),1:" ")
 S @TEMP@(VAL)=""
 Q
SUI 
 D INIT^%QUCHOIP(TEMP,0,1,0,0,78,20)
 D OFF^%VZEATT
 S @MN="20^10^79"
 S @MN@(1)=$$^%QZCHW("Articles")_"^HIS"
 S @MN@(1,"COM")=$$^%QZCHW("Acces aux articles")
 S @MN@(4)=$$^%QZCHW("Suppression")_"^SUP"
 S @MN@(4,"COM")=$$^%QZCHW("Suppression d'etudes")
 D AFF^%QUCHOIP
MEN 
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,21,MN,.ADRES,.CONTR) G:ADRES'="" @ADRES
 G:(CONTR="A")!(CONTR="F") FIN
 G MEN
FIN D END^%QUCHOIP
 K @(MN),@(TEMP),@(LSEL)
 Q
HIS 
 S VAL=$$UN^%QUCHOIP
 I VAL="" G MEN
 S ET=$P(VAL," ")
 D MAKEUC
 D ^%QULELU("^[QUI]RQSDON(""TPK"","""_ET_""",""graphe"")","^[QUI]RQSDON(""TPK"","""_ET_""",""racine"")",12,4,UCONT,"nomenclature d'entree")
 G MEN
 
SUP 
 K @(LSEL)
 D ^%QUCHOYP(LSEL)
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de ces etudes"))'=1 G MEN
 S SUPTXP=$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression des etudes TXP associees"))'=1
 S VAL="" F %V=0:0 S VAL=$O(@LSEL@(VAL)) Q:VAL=""  D SUPIONE
 D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 D INIT^%QUCHOIP(TEMP,0,1,0,0,78,20)
 D AFF^%QUCHOIP
 G MEN
SUPIONE 
 S ET=$P(VAL," ")
 I SUPTXP S A="" F %A=0:0 S A=$O(^[QUI]RQSDON("TPK",ET,"etudie",A)) Q:A=""  S ETTXP="" F %E=0:0 S ETTXP=$O(^[QUI]RQSDON("TPK",ET,"etudie",ETTXP)) Q:ETTXP=""  D SUPET^%TXPETU(ETTXP)
 K ^[QUI]RQSDON("TPK",ET),@TEMP@(VAL)
 Q
 
 
 
MAKEUC S @UCONT@("AUTRE",1)="TXPETU^%TXPKETU",@UCONT@("AUTRE",1,"TXT")="TXPETU",@UCONT@("AUTRE",1,"COM")="Acceder aux Etudes TXP de cette article"
 S @UCONT@("AUTRE",2)="CARAC^%TXPKETU",@UCONT@("AUTRE",2,"TXT")="caracteristiques",@UCONT@("AUTRE",2,"COM")="Attributs de l'article au moment du $PLANIFIER"
 Q
 
 
TXPETU(TP) N TY,OB
 S MODG=0,OKU=1,ARTICLE=@TP@("O")
 D MEM^%QCAMEM
 K (QUI,WHOIS,TY,ARTICLE,ET) D CURRENT^%IS,VARSYS^%QCSAP
 D INIVAR^%TXPETU
 S MN=$$TEMP^%SGUTIL
 S @MN="20^10^79"
 S @MN@(1)=$$^%QZCHW("Article")_"^ART"
 S @MN@(1,"COM")=$$^%QZCHW("Acces a l'article")
 S @MN@(2)=$$^%QZCHW("Atelier")_"^ATE"
 S @MN@(2,"COM")=$$^%QZCHW("Acces a l'atelier")
BB D CLEPAG^%VVIDEO
 S ETUDE=$$UN^%PKCHOIX("^[QUI]RQSDON(""TPK"","""_ET_""",""etudie"","""_ARTICLE_""")",10,10,20)
 G:ETUDE="" FBB
 S SVARTI=ARTICLE
 S ATELIER=$$^%QSCALVA("ARTICLE",ARTICLE,"SE.FABRIQUE.A")
 S MENG=$$TEMP^%SGUTIL,TEMP=$$TEMP^%SGUTIL
 S PMAX=$$^%TXPMAX(ATELIER)
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,21,MN,.ADRES,.CONTR) G:ADRES'="" @ADRES
 G:(CONTR="A")!(CONTR="F") BB
 G BB
ART D CLEPAG^%VVIDEO
 D SUITE^%TXPETY
 G BB
ATE 
 D CLEPAG^%VVIDEO
 D SUITE^%TXPETT
 S ARTICLE=SVARTI
 G BB
 
FBB D RMEM^%QCAMEM Q
 Q
 
 
CARAC(TP) 
 S OBJ=@TP@("O")
 D CLEPAG^%VVIDEO
 S DX=10,DY=2 X XY W OBJ
 S DX=5,DY=6 X XY W "STOCK.EN.COURS"
 S DX=30,DY=6 X XY W $S($D(^[QUI]RQSDON("TPK",ET,"attributs",OBJ,"en cours")):^[QUI]RQSDON("TPK",ET,"attributs",OBJ,"en cours"),1:"")
 S DX=5,DY=8 X XY W "NOMBRE.DE.KITS.EN.STOCK"
 S DX=30,DY=8 X XY W $S($D(^[QUI]RQSDON("TPK",ET,"attributs",OBJ,"kits")):^[QUI]RQSDON("TPK",ET,"attributs",OBJ,"kits"),1:"")
 D ^%VZEAVT("")
 Q

