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

;%MZVISA^INT^1^59547,73872^0
%MZVISA(INDIV) 
 
 
 
 
 
 
 
 
 
 
 N A,ADRES,ATT,CONTR,DXD,DXG,DXX,DYB,DYH,GRAPH,MSG,SIGN,TOTO
 S TOTO(1)=$$^%QZCHW("Fin")_"^FIN"
 S TOTO(2)=$$^%QZCHW("Ajouter une signature")_"^SIGNER"
AFF D AFFICH
ACT D POCLEPA^%VVIDEO
ADR D ^%VQUIKMN(0,80,23,"TOTO",.ADRES,.CONTR) Q:(CONTR="A")!(CONTR="F")  G:CONTR="R" AFF G:ADRES'="" @ADRES G ADR
 
FIN D CLEPAG^%VVIDEO Q
SIGNER D SAISIGN G:Y1="" AFF
 D INT^%QSVVISE($$GE^%MZQS,INDIV,SIGN,61,4,18,19) G AFF
 
SAISIGN D POCLEPA^%VVIDEO W $$^%QZCHW("Signataire : ") S DX=$X,DY=$Y D ^%VLEC
 I CTRLA!(Y1="") D POCLEPA^%VVIDEO Q
 S SIGN=Y1
 I '($D(^[QUI]RQSVSIGN(SIGN))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Signataire inconnu...[RETURN]") R *DXX:^TOZE($I,"ATTENTE") G SAISIGN
 Q
 
AFFICH D CLEPAG^%VVIDEO,TITRE,AFFVISA Q
TITRE S DXG=0,DXD=79,DYH=0,DYB=2,GRAPH=0,BIG=0,MSG=$$^%QZCHW("VISAS ("_INDIV_")") D 4^%VZCD
 D CARSP^%VVIDEO(0,4,18,60,1) Q
AFFVISA S ATT="VISA.",DX=2,DY=5 X XY D REV^%VVIDEO,BLD^%VVIDEO W "Type" S DX=30 X XY W "Date" S DX=40 X XY W "Signataire" D NORM^%VVIDEO
 F A=0:0 S ATT=$$NXTRIA^%QSTRUC8($$GI^%MZQS,INDIV,ATT) Q:ATT'["VISA."  D IMPR
 Q
IMPR Q:ATT[".HEURE"
 I ATT[".DATE" S DX=30 X XY W $$^%QSCALVA($$GI^%MZQS,INDIV,ATT) Q
 S DY=DY+1,DX=2 X XY W ATT S DX=40 X XY W $$^%QSCALVA($$GI^%MZQS,INDIV,ATT) Q

