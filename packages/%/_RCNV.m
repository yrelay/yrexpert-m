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

;%RCNV^INT^1^58140,5735^0
%RCNV ;Convert existing ROUTINE global to new format ;JO1052 06/29/98  ; Compiled March 6, 2000 19:35:35
1 N DEFDIR,DIRNAM,DT,SYS,DIR,ROU,EXT,TT,SELF,FF,CRT,NEWPAGE,POP,%msub
 N %A,%E,%X,%ANS,IO,IOF,IOM,IOST,IOT,IOBS,IOPAR,IOSL,RMSDF
 N dirset,NOW,%TIM,PAGE,B,RCOUNT,count,%DN,%DS,%TN,%TS,SD,I,L,N,X
 S $zt=$S($G(MDEBUG)=1:"",1:"ERROR"),$ze=""
 S DEFDIR=$$DEFDIR(),POP=0
 d ^%RSETN("Routine(s): ","","MAC,INC","DNEV",$s($g(convert)=-1:0,$d(^mMAC):2,1:1)) G KILL:POP
DISP ;
 I $O(^mtemp(%msub,""))="" G KILL ;nothing was selected
 W !!,"Display on"
 d OUT^%IS G KILL:POP
 S SELF=($I=IO),NEWPAGE=1,POP=0,CRT=(IOST?1"C".E) S:'SELF CRT=0
 S FF="W "_IOF_" S $Y=0"
 I IOM>80 S IOM=80 ;make sure right margin isn't too big
 S NOW=$$DO($h,2)_" " d INT^%T s NOW=NOW_%TIM
 S $zt="DONE^"_$P($ZPOS,"^",2) U IO D SHORT
DONE S $zt="" I $D(SELF),'SELF U IO X FF C IO
KILL U 0 I $D(%msub) K ^mtemp(%msub)
 QUIT
SHORT S SD="",PAGE="",RCOUNT=0
SSD S SD=$O(^mtemp(%msub,SD)) QUIT:SD=""
 S SYS=$P(SD,"@"),DIR=$P(SD,"@",2,999),NEWPAGE=1,ROU=""
SROU S ROU=$O(^mtemp(%msub,SD,ROU)) G SSD:ROU="" S EXT=""
EXT S EXT=$O(^mtemp(%msub,SD,ROU,EXT)) G SROU:EXT=""
 i $g(convert)=-1 d convert2(EXT,ROU) i 1  ;Undo it
 e  d convert(EXT,ROU)
 S RCOUNT=RCOUNT+1 ;count how many routines have been printed
 I RCOUNT=1 D CHKSDY(3) QUIT:POP
 I RCOUNT=1 D CC("--  ."_EXT_"  --") W !
 I $X\10+1*10+$L(ROU)>79 W ! I $Y+3>IOSL D HD QUIT:POP
 W:$X ?$X\10+1*10 W ROU G EXT
CHKSDY(Y) G HD:NEWPAGE,HD:$Y+Y>IOSL QUIT
HD I CRT,PAGE]"" W ! D MORE QUIT:POP
 S:NEWPAGE NEWPAGE=0,PAGE=0 S PAGE=PAGE+1 X FF
 D CC("Listing of Selected Routine/Include Files Converted")
 S X="Directory: "_$S(DIR="":DEFDIR,1:DIR)
 S X=X_$S(SYS]"":"  -  Directory Set: "_SYS,1:"")
 D CC(X),CC(NOW_"   Page "_PAGE) W ! QUIT
CC(X) W !?IOM-$L(X)\2,X QUIT
MORE R !,"--more--",*C I C'=10,C'=13,C'=27,C'=32,C'=63 S POP=1 QUIT
 QUIT:C'=63  W "  Return to continue, ^ to stop" G MORE
ERROR I $ze'["<INTERRUPT>" U 0 W !,"Error: "_$p($p($ze,">"),"<",2)
 S POP=1 QUIT
DO(%DN,f) QUIT $ZDATE(%DN,+$G(f)) ;'f' is format
DEFDIR() ;return the default (current) directory name
 Q "" ;Cache site -- can't do it yet
UC(x) q $zcvt(x,"u")
 q
convert(rtntype,rtname)  ;run it
 n gref,grefsav,savver,ver
 s gref=$s(rtntype="INC":"^"_"rINC",1:"^"_"rMAC")_"(rtname)"
 s grefsav=$s(rtntype="INC":"^"_"rINCSAVE",1:"^"_"rMACSAVE")_"(rtname)"
 i $d(^ROUTINE(0,rtntype,1,rtname)) d
 . m @gref=^ROUTINE(0,rtntype,1,rtname)
 . k ^ROUTINE(0,rtntype,1,rtname)
 . s ver="",savver=0 f  s ver=$o(^ROUTINE(0,rtntype,ver),-1) q:+ver<2  i $d(^(ver,rtname)) s savver=savver+1 d
 .. m @grefsav@(savver)=^ROUTINE(0,rtntype,ver,rtname,0)
 .. k ^ROUTINE(0,rtntype,ver,rtname)
 . i savver s @grefsav@(0)=savver
 e  d
 . n oref,orefssave 
 . s oref=$s(rtntype="MAC":"^mMAC",1:"^mINC")_"(rtname)"
 . s orefsave=$s(rtntype="MAC":"^mMAC",1:"^mINC")_"SAVE(rtname)"
 . i $d(@oref) d
 .. m @gref=@oref
 .. k @oref
 .. s savver=0,ver="" f  s ver=$o(@orefsave@(ver)) q:ver=""  d
 ... m @grefsav@(ver)=@orefsave@(ver)
 ... k @orefsave@(ver) s savver=ver
 .. i savver s @grefsav@(0)=savver k @orefsave
 q
convert2(rtntype,rtnname) ; Unconvert a directory (no backups)
 n gref s gref=$s(rtntype="MAC":"^mMAC",1:"^mINC")_"(rtnname)"
 m ^ROUTINE(0,rtntype,1,rtnname)=@gref
 k @gref
 QUIT
unconvert ;Undo it
 n convert s convert=-1 g 1
rtnset ; convert routine sets
 n back,ext,i,list,maxmac,maxinc,rset,ver,x
 s maxmac=$o(^ROUTINE(0,"MAC",""),-1)
 s maxinc=$o(^ROUTINE(0,"INC",""),-1)
 s rset=""
 f  s rset=$o(^mutil("rset",rset)) q:'rset  d:$p($g(^mutil("rset",rset,1)),$c(1),3)'="mMAC"
 . s list=$g(^mutil("rset",rset,3,0))
 . f i=1:1:list s rtn=$g(^mutil("rset",rset,3,i)),x="" d
 .. s sys=$p(rtn,$c(1)),dir=$p(sys,"@",2),sys=$p(sys,"@")
 .. i (sys_dir)'="" s x=$s(sys="":"|"""_dir_"""|",1:"|""^"_sys_"^"_dir_"""|")
 .. s ext=$p(rtn,$c(1),3) q:ext="INT"!(ext="OBJ")
 .. s ver=$p(rtn,$c(1),4),rout=$p(rtn,$c(1),2) s:ver=1 ver=0
 .. i ver s back=$s(ext="MAC":maxmac,1:maxinc)+1,new=0 d  s ver=new
 ... f  s back=$o(^ROUTINE(0,ext,back),-1) q:(back<ver)  s new=new+1
 .. s x=x_rout_"."_ext_"."_ver
 .. s $p(rtn,$c(1),4)=ver,^mutil("rset",rset,3,i)=rtn
 .. s ^mutil("rset",rset,2,i)=x
 .. q
 . s $p(^mutil("rset",rset,1),$c(1),3)="mMAC" q
 q
ALL ;
all ;
 n old,x s old=$s($d(^mMAC):2,1:1)
 s db=$c(1),x=$c(1)_"*"_$c(1)_"*"_$c(1)_"*",exts="MAC,INC",sort="DNEV"
 s %msub=$$%msub^%RSETN,DEFDIR=$$DEFDIR(),POP=0
 d ADDONE^%URSETB(x,"")
 g DISP

