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

;%QUA2^INT^1^59547,73884^0
ZAFFPA2M ;
 
 
 
 
M(M) D POCLEPA^%VVIDEO W $$^%QZCHW(M) Q
CADR S DXG=^Z($J,Z,"X"),DYH=^Z($J,Z,"Y"),LH=^Z($J,Z,"L"),LV=^Z($J,Z,"H"),BLD=1 D CARS^%VVIDEO Q
NPAG(PAGE) S DX=(^Z($J,Z,"X")+^Z($J,Z,"L"))-20,DY=^Z($J,Z,"Y") X XY W $$^%QZCHW(" Page "),PAGE,"/",^Z($J,Z,"NP")," " Q
PAGEC(PAGE) N COL S COL=1 G PAGEG
PAGEI(PAGE) N COL S COL=0
PAGEG N A,BASE,I,L,LD,LF,O,%O,OK,P,T,V,XD,XF S T=^Z($J,Z,"T"),BASE=^Z($J,Z,"B"),XD=^Z($J,Z,"X"),XF=(XD+^Z($J,Z,"L"))-1,OK=$D(^Z($J,Z,"C")),A=^Z($J,Z,"A"),L=0,LD=^Z($J,Z,"Y")+2,LF=(LD+^Z($J,Z,"H"))-3 G:COL PAGES S DX=XD+1,DY=LD-1 X XY W $J("",^Z($J,Z,"L")-2)
 N TAB S TAB=0 K ^Z($J,Z,"TAB") S ^Z($J,Z,"TAB",TAB)=XD+2 D REV^%VVIDEO,BLD^%VVIDEO S P=(XD+^Z($J,Z,"LR"))+3
 F I=^Z($J,Z,"DEP"):1 Q:(P'<XF)!('($D(^Z($J,Z,"C",I))))  S TAB=TAB+1,^Z($J,Z,"TAB",TAB)=P,E=(XF-P)-1,E2=^Z($J,Z,"C",I,"L"),E=$S(E2>E:E,1:E2),DX=P X XY S P=(P+E)+1 I $D(^Z($J,Z,"C",I,"T")) W:^Z($J,Z,"C",I,"T")'="" $E(^Z($J,Z,"C",I,"T"),1,E)
PAGES D NORM^%VVIDEO G:'($D(^Z($J,Z,"P",PAGE))) PGCL S O=^Z($J,Z,"P",PAGE)
 N J,%J,NI S NI=$$^%QCAZG("^Z($J,Z,""N"")")
 F %O=0:0 Q:(O="")!(((L+LD)+1)=LF)  D NIV1:NI="",NIV2:NI'="" S O=$O(@A@(O))
PGCL S DX=XD+1 F L=L:1 Q:((L+LD)+1)=LF  S DY=LD+L X XY W $J("",^Z($J,Z,"L")-2)
 Q
NIV1 S V=$S(T:@A@(O),1:O),DX=XD+1,DY=LD+L,L=L+1 X XY W:'(COL) $J("",^Z($J,Z,"L")-2) D:'(COL) @($S($D(^Z($J,Z,"S",O)):"BLD",1:"NORM")_"^%VVIDEO") D IPS D:OK&('(COL)) CARA^%QUAPAGM
 Q
NIV2 S J="" F %J=0:0 S J=$O(@A@(O,J)) Q:(J="")!(((L+LD)+1)=LF)  S V=$S(T:@A@(O,J),1:O_","_J),DX=XD+1,DY=LD+L,L=L+1 X XY W:'(COL) $J("",^Z($J,Z,"L")-2) D:'(COL) @($S($D(^Z($J,Z,"S",O)):"BLD",1:"NORM")_"^%VVIDEO") D IPS D:OK&('(COL)) CARA^%QUAPAGM
 Q
IPS X XY W " ",$E($$S^%QAX(V),1,^Z($J,Z,"LR")) Q
GOS N A,B,COL,%F,I,NB,P,S,T,V,XXX,YYY,Z S Z=^Z($J)
GO2 I '($D(^Z($J,Z,"R"))) D ^%VSQUEAK Q:'(MODE) "" Q
 D NET^%QUAPA5M S T=^Z($J,Z,"T"),B=^Z($J,Z,"B"),COL=0,P=^Z($J,Z,"P"),A=^Z($J,Z,"A"),XXX=^Z($J,Z,"TAB",COL),S=^Z($J,Z,"R",^Z($J,Z,"P"),"D"),YYY=^Z($J,Z,"Y")+2,NB=$$NOMLOG^%QSF(B)
UNX G UNX^%QUAPA5M
UN0 G UN0^%QUAPA5M
SUIT G SUIT^%QUAPA5M
NET G NET^%QUAPA5M

