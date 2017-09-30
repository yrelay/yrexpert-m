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

;%MZEDSF^INT^1^59547,73871^0
MOZEDSF ;
 
 
 
 
 
 
 
 
 
 
IN S:'($D(%EDI)) %EDI=11 S @%TT@($J,0,EDCL)=XOP_"^"_X,$P(%ED,U,1)=%EDI D SET^%MZINSF Q
ED S X=$P(@%TT@($J,0,EDCL),"^",2,999),XOP=$P(@%TT@($J,0,EDCL),"^",1),$P(%ED,U,1)=%EDE D SET^%MZINSF Q
E D ^%VSQUEAK S EDRP=0 Q
X S @%TT@($J,0,EDCL)=$S($D(XOP):XOP,1:0)_"^"_X,X=$P(^(EDN),"^",2,999),XOP=$P(^(EDN),"^",1),EDCL=EDN Q
PS S:'($D(%TAB)) %TAB=0 S EDN=0 F ED=0:0 S ED=@%TT@($J,0,EDFL,0) Q:'(ED)  S EDFL=ED,EDN=((($L(@%TT@($J,0,ED))-1)\RM)+1)+EDN Q:EDN>(EDSL-1)
 G E:'(EDN) S EDN=EDFL,EDP=1,%=3 D X G:%TAB=0 NS1
PS2 G:'((X="u0")!((X="u2")!(X="u3"))) PS1 D PL^%MZED G PS2
PS1 K LP S:(%TAB>0)&(XOP=1) %TAB=1 Q
NS D NORM^%VVIDEO
 S EDN=0 F ED=0:0 S ED=$O(@%TT@($J,0,EDFL)) Q:'(ED)  S EDFL=ED,EDN=((($L(^(ED))-1)\RM)+1)+EDN Q:EDN>(EDSL-1)
 G E:'(EDN) S EDN=EDFL,EDP=1,%=3 D X Q
NS1 G:'((X="u0")!((X="u2")!(X="u3"))) NS2 D NL^%MZED G NS1
NS2 K LP S %TAB=2 Q
MS S EDN=0,EDFL=EDCL G:'(EDFL) E F ED=0:0 S ED=@%TT@($J,0,EDFL,0) Q:'(ED)  S EDFL=ED,EDN=((($L(@%TT@($J,0,ED))-1)\RM)+1)+EDN Q:EDN>(EDSL/2)
 Q
PLC S:'($D(%TAB)) %TAB=0 G E:($L(X)+$L(EDDC))>500 S X=$E(X,1,EDP-1)_EDDC_$E(X,EDP,999),%=1 Q
PLW S:'($D(%TAB)) %TAB=0 G E:($L(X)+$L(EDDW))>500 S X=$E(X,1,EDP-1)_EDDW_$E(X,EDP,999),%=1 Q
PLL S:'($D(%TAB)) %TAB=0
 I EDDL(1)'=3,$L(X)'=0 G E
 G E:($L(X)+$L(EDDL))>500
 S X=$E(X,1,EDP-1)_EDDL_$E(X,EDP,999),%=1,XOP=EDDL(1)
 I (XOP=1)!(XOP=2) X XY D @("BLD^%VVIDEO"_$S(XOP=2:"",1:",REV^%VVIDEO"))
 
 I $O(@%TT@($J,0,EDCL))="" S @%TT@($J,0,EDCL+1)="3^",@%TT@($J,0,EDCL+1,0)=EDCL,EED(EDCL+1)=EDCL
 Q
FQ D IN
 S %Q="Chercher: ",X=$S($D(EDST)#2:EDST,1:EMP) D ^%MZIN S EDST=X D ED
 Q
FNS 
 S ED=$F($E($$ZSUBST^%QZCHSUB(X,$C(1),""),EDP,999),EDST)
 I ED S EDP=(EDP+ED)-1 Q
 S EDN=EDCL
 F ED=0:0 S EDN=$O(@%TT@($J,0,EDN)) G E:'(EDN) S XED=$P(^(EDN),"^",2,999),ED=$F($$ZSUBST^%QZCHSUB(XED,$C(1),""),EDST) Q:ED
 S EDP=ED D X
 Q
FRQ D IN
Q1 S %Q="Remplacer: ",X=$S($D(EDST)#2:EDST,1:EMP) D ^%MZIN G FRQQ:^MOZED($J) S EDST=X
Q2 S %Q="par: ^^22",X=$S($D(EDS2)#2:EDS2,1:EMP) D ^%MZIN G Q1:(+(^MOZED($J)))=1 S EDS2=X
FRQQ D ED Q
RS G E:($P($E(X,1,EDP-1),EDST,$L($E(X,1,EDP-1),EDST))'=EMP)!(EDP'>1)
 G E:(($L(X)-$L(EDST))+$L(EDS2))>500
 S X=$P(X,EDST,1,$L($E(X,1,EDP-1),EDST)-1)_EDS2_$E(X,EDP,999),EDP=(EDP-$L(EDST))+$L(EDS2)
 S DX=0
 Q
FRALL D FRQ Q:^MOZED($J)  F ED=0:0 D FNS Q:'(ED)  D RS
 Q
FRIA D FRQ Q:^MOZED($J)  F ED=0:0 D FNS Q:'(ED)  D POS^%MZED,RD^%MZED D:IN=32 RS,W,SRF^%MZED Q:(IN'=13)!(IN'=32)
 Q
CTR S DX=0,DY=21 X XY W %Q X XL R *IN:^TOZE($I,"ATTENTE") S:'($T) IN=128 W $C((IN+64)#128) I $D(^MOZ("C",+(%ED),SET,IN,1))#2 S EDR=129,^MOZED($J,EDR)=^(1) Q
 D E G CTR
TAB Q:%TAB=0  G:$D(TBDX) TAB1
 Q:('($D(^MOZ("C","L"))))&('($D(^MOZ(WHOIS,"C","L"))))
 K TBP,TBL,TBDX F %WU=1,2 S TABI=$S($D(^MOZ(WHOIS,"C","L",%WU)):"^MOZ(WHOIS,""C"",""L"",%WU)",1:"^MOZ(""C"",""L"",%WU)") D TAB^%MZTABUL
TAB1 S PP=$N(TBDX(%TAB,$X)) Q:PP=-1  S EDPP=PP-$X,X=$E(X,1,EDP-1)_$J("",EDPP)_$E(X,EDP,999),X=$E(X,1,80),EDP=EDP+EDPP,%=2,EDCLP=EDCL Q
 
 Q
 
FB S EDN=0 Q:'(ED)  Q:'($D(@%TT@($J,0,$P(ED,U,1)))#2)  S EDN=$P(ED,U,1) D X S EDP=$S($P(ED,U,2)>$L(X):$L(X)+1,1:$P(ED,U,2)) Q
 
RB I $$^%QCAZG("%EDTR")'=1 S %EDTR=1,EDBB=EDCL_U_EDP W "POINTER" H 1 S DX=1 X XY W $J(" ",21) Q
 S %EDTR=0
 S EDL=EDCL,EDPP=EDP,ED=$S($D(EDBB):EDBB,1:EMP) D FB G E:'(EDN) K @%TT@($J,1) I EDCL>EDL Q
 I EDL=EDCL Q:EDP'<EDPP  S @%TT@($J,1,1)=$E(X,EDP,EDPP-1),^(0)=1,X=$E(X,1,EDP-1)_$E(X,EDPP,999),%=1 Q
 G E:((EDP+$L(@%TT@($J,0,EDL)))-EDPP)>500
 W "EFFACER" H 1 S DX=1 X XY W $J(" ",21)
 
 S @%TT@($J,1,1)=XOP_"^"_$E(X,EDP,999),X=$E(X,1,EDP-1),EDS=EDCL
 F ED=2:1 S EDS=$O(@%TT@($J,0,EDS)) Q:EDS'<EDL  S @%TT@($J,1,ED)=@%TT@($J,0,EDS) K @%TT@($J,0,EDS),ED(EDS) S:EDS=EDFL EDFL=EDCL
 S @%TT@($J,1,ED)=$E(@%TT@($J,0,EDL),1,EDPP-1),@%TT@($J,1,0)=ED,X=X_$E(@%TT@($J,0,EDL),EDPP,999) K @%TT@($J,0,EDL),ED(EDL) S:EDFL=EDL EDFL=EDCL S EDN=$O(@%TT@($J,0,EDCL)),EDCLP=EDCL,%=2 S:EDN ^(EDN,0)=EDCL
 S XOP=$P(X,"^",1),X=$P(X,"^",2) D RST^%MZED
 Q
 
WB G E:'($D(@%TT@($J,1))) S ED=@%TT@($J,1,0)
 I ED=1 S ED=@%TT@($J,1,1) G E:($L(X)+$L(ED))>500 S X=$E(X,1,EDP-1)_ED_$E(X,EDP,999),EDBB=EDCL_U_EDP,EDP=EDP+$L(ED),EDCLP=EDCL,%=2 Q
 G E:(((EDP-1)+$L(@%TT@($J,1,1)))>500)!(((($L(^(ED))+$L(X))-EDP)+1)>500)
 W "DEPOSER" H 1 S DX=1 X XY W $J(" ",21)
 S @%TT@($J,0,EDCL)=$E(X,1,EDP-1)_(^(1)),X=$E(X,EDP,999),EDBB=EDCL_U_EDP,EDL=EDCL,EDN=$O(@%TT@($J,0,EDCL)),EDS=$S(EDN:(EDN-EDCL)/ED,1:1) G E:(EDCL+EDS)=EDCL S EDCLP=EDCL,%=2
 F EDN=2:1:ED-1 S EDPP=EDL,EDL=EDL+EDS,@%TT@($J,0,EDL)=@%TT@($J,1,EDN),^(EDL,0)=EDPP
 S EDPP=EDL,EDCL=EDL+EDS,X=@%TT@($J,1,ED)_X,EDP=$L(^(ED))+1,@%TT@($J,0,EDCL)=X,^(EDCL,0)=EDPP,EDN=$O(@%TT@($J,0,EDCL)) S:EDN ^(EDN,0)=EDCL
 Q

