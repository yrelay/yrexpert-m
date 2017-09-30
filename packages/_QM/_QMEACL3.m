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

;%QMEACL3^INT^1^59547,73877^0
QMEACL3 ;
 
LEC(X1,XC,YC,PL,PC,DON,COL) 
 N C1,Y1,CTR,OK,OLD,YG,XG,CTRLA,CTRLF,CTRLG,PCX,PCY
 S C1=$C(X1),OLD=@DON@(PL,PC)
BLEC S DX=PX,DY=PY X XY W C1
 S YG=C1,PCX=PX,PCY=PY D BEG^%VLEC
 
 
 I Y1="" S Y1=OLD G:OLD'="" FIN
 S OK=$$UC(Y1,PL,PC,COL)
 I '(OK) D ^%VSQUEAK,REAFV(OLD) Q
FIN D REAFV(Y1) S @DON@(PL,PC)=Y1
 Q
 
 
 N C1,YY1,CTR,OK,OLD
 S C1=$C(X1),OLD=@DON@(PL,PC)
 D S1^%VLECFL("",C1,XC,YC,.CTR,.YY1)
 I CTR="A" S YY1=OLD G FIN
 S YY1=C1_YY1
 S OK=$$UC(YY1,PL,PC,COL)
 I '(OK) D ^%VSQUEAK,REAFV(OLD) S C1="" G BLEC
 D REAFV(YY1) S @DON@(PL,PC)=YY1
 Q
 
UC(V,L,C,COL) 
 N BON
 I '($D(@COL@(C,"UC"))) Q 1
 S V=$$S1^%QZCHAD(V)
 S @("BON=$$"_@COL@(C,"UC")_V_","_C_","_L_")")
 Q BON
 
REAFV(V) 
 S DX=XC,DY=YC X XY W $J("",LARG(PC))
 S DX=XC,DY=YC X XY W V Q
 ;

