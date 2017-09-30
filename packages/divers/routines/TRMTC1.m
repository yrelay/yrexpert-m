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

;TRMTC1^INT^1^59547,74877^0
TRMTC1(CX,FCX) 
 ;; integration numerique par la methode de monte carlo
 ;;
 ;;courbe donnee en six points CX,FCX
 S EPS=1E-6
INIT ;;ordonnes!!
 S CXMIN=CX(1),CXMAX=CX(6) W CXMIN," ",CXMAX," mini et maxi " H 1
 ;; maxi de la courbe : suppose etre un des points
 F I=1:1:6 S CXX(CX(I))=I,FFCX($$FUNC(CX(I)))=I
 S MAX=$ZP(FFCX("")),LOOP=1000 W !," max ",MAX H 1
 S IM=0 F %IM=1:1:10 D loop S IM=IM+INTEG,IM1=IM/%IM W " ",IM1,"  "
 S INTEG=IM/10
 W !,!,!,"       valeur de l'integrale ",INTEG
 Q INTEG
loop S Z=0 F I1=1:1:LOOP D LPP
 S SURFACE=(CX(6)-CX(1))*MAX
 S INTEG=((Z/LOOP)*(CX(6)-CX(1)))*MAX
 W !," valeur de l'integrale ",INTEG
 Q
LPP ;;
 S A=$$ALEA,CCX=CXMIN+(A*(CXMAX-CXMIN))
 S A=$$ALEA,CCY=A*MAX
 S FY=$$FUNC(CCX)
 S:FY>CCY Z=Z+1
 Q
ALEA() S ALEA=$R(1000)/1000 Q ALEA
ABS(X) I X>0 Q X
 Q -(X)
 ;;
FUNC(X) ;;TEST
 S FOUND="NIET"
 F I=1:1:6 I $$ABS(CX(I)-X)<EPS S FOUND=I Q
 I FOUND'="NIET" Q FCX(FOUND)
 S X1=X-EPS,D=$N(CXX(X1)),D=CXX(D),G=D-1
 S A=(X-CX(G))/(CX(D)-CX(G))
 Q FCX(G)+(A*(FCX(D)-FCX(G)))

