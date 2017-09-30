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

;%QUAPA2M^INT^1^59547,73884^0
QUAPA2M ;
 
 
 
 
M(M) D POCLEPA^%VVIDEO W $$^%QZCHW(M) Q
 
CADR I '($D(^Z($J,Z,"CADRE"))) D CARSP^%VVIDEO(^Z($J,Z,"X"),^Z($J,Z,"Y"),^Z($J,Z,"H"),^Z($J,Z,"L"),1) Q
 D @$$CONCAT^%QZCHAD(^Z($J,Z,"CADRE"),"Z,^Z($J,Z,""X""),^Z($J,Z,""Y""),^Z($J,Z,""L""),^Z($J,Z,""H"")")
 Q
 
NPAG(PAGE) S DX=(^Z($J,Z,"X")+^Z($J,Z,"L"))-20,DY=^Z($J,Z,"Y") X XY
 W $$^%QZCHW(" Page "),PAGE,"/",^Z($J,Z,"NP")," "
 Q
 
PAGEC(PAGE) N COL S COL=1 G PAGEG
PAGEI(PAGE) N COL S COL=0
 
PAGEG N A,BASE,I,L,LD,LF,O,%O,OK,P,T,V,XD,XF,NORM,REV,BLD,UDL,PP,SYN
 F I="NORM","REV","BLD","UDL" S @(I_"=$$"_I_"^%VVIDEO1")
 
 S SYN=$S(($D(^Z($J,Z,"SYN"))#10)=0:0,1:^Z($J,Z,"SYN"))
 I SYN=1 S SYN("A")=$S(($D(^Z($J,Z,"SYN.A"))#10)=0:"",1:^Z($J,Z,"SYN.A")) I SYN("A")="" S SYN=0
 I SYN=1 S SYN("O")=$S(($D(^Z($J,Z,"SYN.O"))#10)=0:"",1:^Z($J,Z,"SYN.O"))
 S T=^Z($J,Z,"T"),BASE=^Z($J,Z,"B"),XD=^Z($J,Z,"X"),XF=(XD+^Z($J,Z,"L"))-1,OK=$D(^Z($J,Z,"C")),A=^Z($J,Z,"A"),L=0,LD=^Z($J,Z,"Y")+2,LF=(LD+^Z($J,Z,"H"))-3
 ;HL002 G:COL PAGES S DX=XD+1,DY=LD-1 X XY W $J("",^Z($J,Z,"L")-2)
 G:COL PAGES S DX=XD+1,DY=LD-1 X XY W $J("",^Z($J,Z,"L")-3)
 N TAB S TAB=0 K ^Z($J,Z,"TAB") S ^Z($J,Z,"TAB",TAB)=XD+2
 X XY W REV W:'(IBMPC) BLD
 S P=(XD+^Z($J,Z,"LR"))+3
 F I=^Z($J,Z,"DEP"):1 Q:(P'<XF)!('($D(^Z($J,Z,"C",I))))  S TAB=TAB+1,^Z($J,Z,"TAB",TAB)=P,E=(XF-P)-1,E2=^Z($J,Z,"C",I,"L"),E=$S(E2>E:E,1:E2),DX=P X XY S P=(P+E)+1 I $D(^Z($J,Z,"C",I,"T")),^Z($J,Z,"C",I,"T")'="" W $E(^Z($J,Z,"C",I,"T"),1,E)
PAGES S (DX,DY)=0 X XY W NORM
 G:'($D(^Z($J,Z,"P",PAGE))) PGCL
 D CARAB
 S O=^Z($J,Z,"P",PAGE)
 ;HL002 F %O=0:0 Q:(O="")!(((L+LD)+1)=LF)  S V=$S(T:@A@(O),1:O),DX=XD+1,DY=LD+L,L=L+1 X XY W:'(COL) $J("",^Z($J,Z,"L")-2) D CARU S O=$O(@A@(O))
 F %O=0:0 Q:(O="")!(((L+LD)+1)=LF)  S V=$S(T:@A@(O),1:O),DX=XD+1,DY=LD+L,L=L+1 X XY W:'(COL) $J("",^Z($J,Z,"L")-3) D CARU S O=$O(@A@(O))
;HL002 PGCL S DX=XD+1 F L=L:1 Q:((L+LD)+1)=LF  S DY=LD+L X XY W $J("",^Z($J,Z,"L")-2)
PGCL S DX=XD+1 F L=L:1 Q:((L+LD)+1)=LF  S DY=LD+L X XY W $J("",^Z($J,Z,"L")-3)
 Q
 
CARAB S (P,PP)=(XD+^Z($J,Z,"LR"))+3
 F I=^Z($J,Z,"DEP"):1 Q:(P'<XF)!('($D(^Z($J,Z,"C",I))))  S E=(XF-P)-1,(E2,PP(I,"L"))=^Z($J,Z,"C",I,"L"),E=$S(E2>E:E,1:E2),PP(I,"C")=^Z($J,Z,"C",I,"C") D CARAB1 S P=(P+E)+1
 Q
CARAB1 S PP(I,"I")=$S(($D(^Z($J,Z,"C",I,"I"))#10)=0:"",1:^Z($J,Z,"C",I,"I")),PP(I,"D")=^Z($J,Z,"C",I,"D") Q:PP(I,"D")'=2
 S PP(I,"FCT")=^Z($J,Z,"C",I,"FCT"),PP(I,"FCT.VT")=^Z($J,Z,"C",I,"FCT.VT")
 Q
 
CARU 
 
 X XY W " " W:'(COL) $S($D(^Z($J,Z,"REV",V)):REV,1:NORM)
 S DX=DX+1 X XY S DX=DX-1 W $E($S(SYN=1:$$^%QAXT(BASE,V,SYN("A"),SYN("O")),1:$$S^%QAX(V)),1,^Z($J,Z,"LR"))
 S DX=0 X XY W NORM
 I '(OK&('(COL))) Q
 N UNIT,ATT,E,I,P,OORD S P=PP
 F I=^Z($J,Z,"DEP"):1 Q:(P'<XF)!('($D(PP(I))))  S E=(XF-P)-1,E2=PP(I,"L"),E=$S(E2>E:E,1:E2),DX=P X XY S ATT=PP(I,"C"),OORD=PP(I,"I") D AFCARU S P=(P+E)+1
 Q
AFCARU S UNIT=$$UNIT^%LXSTOCK(ATT)
 I UNIT'="" S E=E-6
 I PP(I,"D")=0 W $$^%QZCHEV($S(OORD'="":$$^%QSCALIN(BASE,V,ATT,OORD),1:$$^%QSCALVA(BASE,V,ATT)),E,"P") G FAF
 I PP(I,"D")=1 W $$^%QZCHEV($$AFFI^%QMDAUC(BASE,ATT,$$^%QSCALIN(BASE,V,ATT,OORD)),E,"P") G FAF
 N VT1,C,A
 
 S VT1=PP(I,"FCT.VT"),C=PP(I,"C") W @("$$^%QZCHEV("_PP(I,"FCT")_",E,""P"")")
FAF 
 I UNIT'="" S DX=(DX+E)+1 X XY W UNIT S E=E+6
 Q

