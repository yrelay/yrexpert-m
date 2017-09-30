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

;%DLFLPOI^INT^1^59547,73867^0
DLFLPOI ;
 
 
 
 
 
 
 
 N L,LMACH,M,%M,P,SAVX,SAVY
 D CLEPAG^%VVIDEO,CAD
 S L=0,M="",P=1,SAVX=%X,SAVY=%Y
 F %M=0:0 S M=$O(^[QUI]DLFLUX(%FLU,"POINTS",%X,%Y,M)) Q:M=""  S L=L+1,LMACH(L)=M
 D CARSA^%VVIDEO(0,0,80,23),REAFF^%QULIMO3(1,1,"LMACH",0,0,80,23)
 D ^%QULIMO(0,0,80,23,"LMACH",.P,"UCA^%DLFLPOI","UCS^%DLFLPOI")
 K ^[QUI]DLFLUX(%FLU,"POINTS",SAVX,SAVY)
 F L=1:1 Q:'($D(LMACH(L)))  S ^[QUI]DLFLUX(%FLU,"POINTS",SAVX,SAVY,LMACH(L))=""
 Q
 
CAD D CARSP^%VVIDEO(0,0,23,80,1) Q
 
UCA N BID,I
 S PCH=Y1 D ^%LXABR I CONCUR=1 S OK=1 Q
L0 I CONCUR=0 D ^%VSQUEAK,POCLEPA^%VVIDEO G:$$MES^%VZEOUI($$^%QZCHW("Inconnu au lexique, persistez-vous")_" ? ","N")'=1 1 G 79
 D ^%VZEAVT($$^%QZCHW("Ambigu au lexique")_" ...") S OK=0 Q
1 S OK=0 Q
79 S OK=1 Q
 
UCS S OK=1 Q

