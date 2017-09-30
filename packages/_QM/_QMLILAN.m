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

;%QMLILAN^INT^1^59547,73878^0
%QMLILAN(LISTA,ATTR,CTR) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 D MES("",.LISTA,.ATTR,.CTR)
 Q
MES(MES,LISTA,ATTR,CTR) 
 N OORD
 I MES="" S MES=$$^%QZCHW("Liste d'attributs")_" : "
 S CTR="",ATTR=0,XX=$X,YY=$Y
L1 S DX=XX,DY=YY X XY S Y1=$$^%VZAME1(MES) G:CTRLA!CTRLF FIN G:Y1="" VIDE G:Y1="*" TOUS G:Y1="??" LIST
 G:Y1'="?" S1
INT D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Nom d'un attribut , * = tous les attributs , [RETURN] = aucun attribut , ?? = listes d'attributs")) G L1
S1 S ATTR=0
 G:$$EX^%QMLILA(Y1) GO2
 S PCH=$$GETLBLAN^%VTLBLAN($P(Y1,"(")),OORD=$P(Y1,PCH,2) D ^%LXABR
 I CONCUR=1 D POCLEPA^%VVIDEO W Y1," --> " S Y1=PCHCOMP_OORD W Y1 S ATTR=1 H 1
 I '(ATTR) D ^%VZEAVT($$^%QZCHW("Liste d'attributs inconnue ... refusee")) S DX=0,DY=YY D CLEBAS^%VVIDEO G L1
GO2 S LISTA=Y1 Q
 
FIN S LISTA="",CTR=$S(CTRLA:"A",1:"F") Q
 
VIDE 
 S LISTA="" Q
 
TOUS 
 S LISTA="*" Q
 
LIST 
 D INIT^%QUCHOIP("^[QUI]ZLILA",1,"",0,6,79,16),CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Listes d'attributs"))
 D AFF^%QUCHOIP S Y1=$$UN^%QUCHOIP D CLEPAG^%VVIDEO,END^%QUCHOIP G:Y1="" L1 G GO2
 
CHOIX() 
 N Y1
 D INIT^%QUCHOIP("^[QUI]ZLILA",1,"",0,6,79,16),CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Listes d'attributs"))
 D AFF^%QUCHOIP S Y1=$$UN^%QUCHOIP D CLEPAG^%VVIDEO,END^%QUCHOIP
 Q Y1
 ;
 ;

