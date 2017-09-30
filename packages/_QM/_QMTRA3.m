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

;%QMTRA3^INT^1^59547,73879^0
QMTRA3 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MODIF 
 N YY1,CTR,MES,M,QSMOTR,QSMOTRI,DEJAVU
 N REP,REPI,Y1,DREP,BASE,BASI,OLD,NAT
 
 S DREP="^RQSMDL1"
 S QSMOTR="^RQSGLU(""QMTRA"",$J,""QSMOTR"")"
 S QSMOTRI="^RQSGLU(""QMTRA"",$J,""QSMOTRI"")"
 S DEJAVU="^RQSGLU(""QMTRA"",$J,""DEJAVU"")"
 K @(QSMOTR),@(QSMOTRI),@(DEJAVU)
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transformation des donnees (QUERYs)"),0)
LECT S YY1="",MES=$$^%QZCHW("Nom du schema de donnees")_" : "
 D LIRE1^%VREAD(MES,"",10,5,.CTR,.YY1) Q:((CTR="A")!(CTR="F"))!(YY1="")
 S M=YY1 I '($D(^RQSMOD(M))) D ^%VZEAVT($$^%QZCHW("Schema inconnu")_"... ") G LECT
 
BLEC S DX=0,DY=14 X XY D CLEBAS^%VVIDEO
 
L1 S YY1="",MES=$$^%QZCHW("Repertoire")_" : "
 D LIRE1^%VREAD(MES,"",0,14,.CTR,.YY1)
 G:CTR="A" FIN
 I CTR="F" G TRANS
 I YY1="" D ^%VZEAVT($$^%QZCHW("Veuillez donner un nom de repertoire")) G L1
 I '($$REPM^%QSGEST9(YY1)) D ^%VZEAVT($$^%QZCHW("Repertoire inexistant")) G L1
 
 S BASE=YY1,BASI=$$NOMINT^%QSF(YY1)
 
L2 S YY1="",MES=$$^%QZCHW("Attribut a modifier")_" : "
 D LIRE1^%VREAD(MES,"",0,15,.CTR,.YY1)
 G:CTR="A" FIN
 I YY1="" D ^%VZEAVT($$^%QZCHW("Veuillez donner un nom d'attribut")) G L1
 I '($$AR^%QSGE5(BASI,YY1)) D ^%VZEAVT($$^%QZCHW("Attribut inexistant pour ce repertoire")) G L2
 S OLD=YY1
 
L3 S YY1="",MES=$$^%QZCHW("Nouveau nom de l'attribut")_" : "
 D LIRE1^%VREAD(MES,"",0,16,.CTR,.YY1)
 G:CTR="A" FIN
 I YY1="" D ^%VZEAVT($$^%QZCHW("Veuillez donner un nom d'attribut")) G L1
 I $$AR^%QSGE5(BASI,YY1)!$D(@DEJAVU@(BASE,YY1)) D ^%VZEAVT($$^%QZCHW("Attribut deja existant. Veuillez donner un autre nom.")) G L3
 S NAT=YY1
 S @QSMOTR@(M,BASE,OLD)=NAT
 S @DEJAVU@(BASE,NAT)=""
 G BLEC
TRANS 
 S REP=""
 F %I=1:1 S REP=$O(@DREP@(M,REP)) Q:REP=""  S REPI=$P(@DREP@(M,REP),"^",1),@QSMOTRI@(M,REP)=REPI
 D POCLEPA^%VVIDEO
 S Y1=$$MES^%VZEOUI($$^%QZCHW("Lancement de la transformation des donnees? <N>: "),"N")
 I (Y1=-1)!(Y1="NON") S Y1=0
 I Y1=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Abandon de la transformation") G FIN
 S DX=0,DY=3 X XY D CLEBAS^%VVIDEO
 S DX=0,DY=5 X XY W $$^%QZCHW("Transformation des donnees en cours...")
 
 
 D TRA^%QMTRAAT(M,QSMOTR,QSMOTRI)
FIN K @(QSMOTR),@(QSMOTRI),@(DEJAVU)
 Q
 ;

