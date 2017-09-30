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

;%QMTRA4^INT^1^59547,73879^0
QMTRA4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N M,QSMOTR,QSMOTRI,DEJAVU,%ABORT,OK,T,%U,CH
 N REP,REPI,DREP,BASE,OLD,NAT
 
 S DREP="^RQSMDL1"
 S QSMOTR="^RQSGLU(""QMTRA"",$J,""QSMOTR"")"
 S QSMOTRI="^RQSGLU(""QMTRA"",$J,""QSMOTRI"")"
 S DEJAVU="^RQSGLU(""QMTRA"",$J,""DEJAVU"")"
 S %ABORT=0
 K @(QSMOTR),@(QSMOTRI),@(DEJAVU)
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transformation des donnees (QUERYs)"),0)
TEXT 
 S T=$T(MOD),M=$P(T,";;",2)
 Q:M=""
 I '($D(^RQSMOD(M))) D ^%VZEAVT($$^%QZCHW("Schema inconnu")_"... ") G FIN
 S DX=0,DY=3 X XY W $$^%QZCHW("Schema : "),M
 
 F %U=0:1 S T=$T(ATT+%U),CH=$P(T,";;",2) Q:(CH="")!(%ABORT=1)  S BASE=$P(CH,";",1),OLD=$P(CH,";",2),NAT=$P(CH,";",3),OK=$$MGL(BASE,OLD,NAT,M,QSMOTR,DEJAVU) I OK=0 S %ABORT=1
 G:%ABORT=1 FIN
 
 S REP=""
 F %I=1:1 S REP=$O(@DREP@(M,REP)) Q:REP=""  S REPI=$P(@DREP@(M,REP),"^",1),@QSMOTRI@(M,REP)=REPI
 S DX=0,DY=5 X XY D CLEBAS^%VVIDEO
 S DX=0,DY=5 X XY W $$^%QZCHW("Transformation des donnees en cours...")
 
 D TRA^%QMTRAAT(M,QSMOTR,QSMOTRI)
FIN K @(QSMOTR),@(QSMOTRI),@(DEJAVU)
 Q
MGL(BA,OLD,NEW,M,GL,DJ) 
 
 
 
 N BASI
 
 I '($$REPM^%QSGEST9(BA)) D ^%VZEAVT($$^%QZCHW("Repertoire inexistant")_" :  "_BA) Q 0
 
 S BASI=$$NOMINT^%QSF(BA)
 
 I '($$AR^%QSGE5(BASI,OLD)) D ^%VZEAVT($$^%QZCHW("Attribut inexistant pour ce repertoire")_" :  "_OLD) Q 0
 
 I $$AR^%QSGE5(BASI,NEW)!$D(@DJ@(BA,NEW)) D ^%VZEAVT($$^%QZCHW("Attribut deja existant. Donner un autre nom.")_" :  "_NEW) Q 0
 S @GL@(M,BA,OLD)=NEW
 S @DJ@(BA,NEW)=""
 Q 1
MOD ;;
 ;;
ATT ;;
 ;;
 ;

