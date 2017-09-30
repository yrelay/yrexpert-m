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

;%DLANCE3^INT^1^59547,73867^0
DLANCE3 ;
 
 
 
 
DATEFI 
 I RESUL(1)="" D ^%VSQUEAK G DIAL2^%DLANCEM
 S GAM=RESUL(3),REPART=$$ART^%DLCON2
 I '($$VAIR^%QSGE5(REPART,RESUL(2),$$AG^%DLCON2,GAM)) S GAM=$$^%QSCALVA(REPART,RESUL(2),$$AG^%DLCON2) I GAM="" D ^%VZEAVT($$^%QZCHW("Pas de gamme")) G DIAL2^%DLANCEM
 D GAMME(RESUL(1),RESUL(2)_","_GAM)
 D AFF^%DLANCEM
 G DIAL2^%DLANCEM
 
GAMME(LAN,GAM) 
 N REPGA,LGAOP,LIST,TYP,LISTL,LISTD,LISTF,REPLAN,DATF,LISTG,LISTS
 D MSG^%VZEATT($$^%QZCHW("Un instant..."))
 S REPGA=$$GAMME^%DLCON2,LGAOP=$$GO^%DLCON2
 S REPLAN=$$LAN^%DLCON2,DATF=$$DATEFIX^%DLCON2
 S LIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(LIST)
 S LISTG=$$CONCAS^%QZCHAD(LIST,"LIEN")
 S LISTD=$$CONCAS^%QZCHAD(LIST,"DATE")
 S LISTS=$$CONCAS^%QZCHAD(LIST,"STOCK")
 S LISTF=$$CONCAS^%QZCHAD(LIST,"FENETRE")
 D MVG^%QSCALVA(REPGA,GAM,LGAOP,LISTG,.TYP)
 I $O(@LISTG@(""))="" D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Aucun lien")_" "_LGAOP),POCLEPA^%VVIDEO G FIN
 D MVG^%QSCALVA(REPLAN,LAN,DATF,LISTD,.TYP)
 
 S @LISTF@("X")=0,@LISTF@("Y")=2,@LISTF@("L")=79,@LISTF@("H")=19
 S @LISTF@("TI")=$$RGAMME^%DLCON2_" "_GAM_" "_$$^%QZCHW("sur")_" "_$$RLAN^%DLCON2_" "_LAN
 
 S @LISTF@("LI",1,"T")=$$^%QZCHW("No d'operation"),@LISTF@("LI",1,"X")=1
 S @LISTF@("LI",2,"T")=$$^%QZCHW("Operation"),@LISTF@("LI",2,"X")=16
 S @LISTF@("LI",3,"T")=$$^%QZCHW("Date fixee"),@LISTF@("LI",3,"X")=65,@LISTF@("LI",3,"U")="DAT^%DLANCE3",@LISTF@("LI",3,"SUP")=1
 
 S @LISTF@("A")=LISTS
 
 S @LISTF@("CHI",1)="",@LISTF@("CHI",2)=""
 
 S NOP="",I=1
BOP S NOP=$O(@LISTG@(NOP))
 G:NOP="" SAIS
 S @LISTS@(I)=NOP_"^"_@LISTG@(NOP)_"^"_$S($D(@LISTD@(NOP)):$$AFFI^%QMDAUC(REPLAN,DATF,@LISTD@(NOP)),1:"")
 S I=I+1
 G BOP
SAIS 
 D CLEPAG^%VVIDEO
 D ^%QUOLST(LISTF)
FIN 
 K @(LIST)
 Q
 
 
 
DAT 
 N DA
 S OK=1
 S Y1=$$GETLBLAN^%VTLBLAN(Y1)
 G:Y1="" SUP
 S DA=Y1
 I '($$FINT^%QMDAUC(REPLAN,DATF,.DA)) D ^%VZEAVT($$^%QZCHW("La date n'a pas une forme correcte")) S OK=0,Y1="" Q
 S Y1=$$AFFI^%QMDAUC(REPLAN,DATF,DA)
 S OK=DA'=""
 Q:OK=0
 D PA^%QSGESTI(REPLAN,LAN,DATF,DA,$P(@A@(LC),"^"))
 S $P(@A@(LC),"^",3)=Y1
 Q
 
SUP S DA=$P(@A@(LC),"^",3)
 Q:DA=""
 D PSO^%QSGESTI(REPLAN,LAN,DATF,$P(@A@(LC),"^"))
 S $P(@A@(LC),"^",3)=""
 Q
 ;

