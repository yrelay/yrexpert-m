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

;%URSETP^INT^1^58140,5742^0
%URSETP(rou,defdir,defsys) ;Open-M/SQL parse routine selection string ;LFT677 02/03/99  ; Compiled March 6, 2000 19:35:42
 ;%system.INC ; DAS280 06/29/99 
 ;%ST.INC DAS309 11/08/99 
 ; %system.inc: compiled for NETWIDENAMESPACE
 ; %system.inc: compiled for DDPGROUPS
 ; %system.inc: compiled for NETMOREDCPDMN
 ; %system.inc: compiled for USECLUSTER
 ; %system.inc: compiled for RTNINGBL
 ; %system.inc: compiled for DBMSNSP
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
1 N C,E,I,IC,IL,Q,Y,J,PRE,i,max,chk
 S Y=rou,%ERROR="",defdir=$G(defdir),defsys=$G(defsys)
 D CTRL I %ERROR]"" QUIT  ;has control characters
 I $E(Y)="@" G RSETS ;handle parsing ROUTINE SETS
 I $E(Y)="$" G SHORT ;defining SHORTCUTS
 D PREFIX I %ERROR]"" QUIT  ;problem with directory,system prefix
 D REST ;parse the rmainder into ROU.EXT.VER
Q QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
CTRL S:Y?.E1C.E %ERROR="No control characters, please" QUIT  ;check for ctrls
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
PREFIX ;Return %DIR,%SYS and I=last position parsed (usually where "]" is).
 I $E(Y)="^" S Y=$E(Y,2,$L(Y)) ;Strip leading ^
 I $E(Y)'="[" S (%DIR,%SYS)="",I=0 QUIT  ;No prefix dir/sys
 I $E(Y,1,2)="[]" S %DIR=$G(defdir),%SYS=$G(defsys),I=2 QUIT
 I $E(Y,1,3)="[^]" S %DIR=$G(defdir),%SYS=$G(defsys),I=3 QUIT
 ;Same as last time
 I Y?1"[$"1A.AN1"]".E DO  QUIT  ;evaluate a shortcut
 . D DOSHRT($P($P(Y,"[",2),"]"),.%DIR,.%SYS) S I=$L($P(Y,"]"))+1
 I $L(Y,"]")=1,$E(Y,2)="""",Y["""]",$E(Y,3,$F(Y,"]")-3)'[""""
 I  I $P(Y,"]")'["," S I=$F(Y,"]")-1,%DIR=$E(Y,3,I-2),%SYS="" QUIT
 ;^^ Prefix consists of ["dir"] (dir in quotes, with no comma or "]")
 S Q=0,I=1,C=0,IC=$L(Y)
PREFIXI S I=I+1,E=$E(Y,I) I E="]",'Q G PREFIX2
 ;If reach "]" and not within quotes ('Q means not within quotes),
 ;then we're done with [dir,sys] portion
 I E="""" S Q='Q G PREFIXI
 ;Quote character toggles the inside-quotes/outside-quotes switch Q
 I E="",Q S %ERROR="Unbalanced quotes" Q
 I E="",'Q S %ERROR="""["" without ""]"" in directory prefix" QUIT
 I E=",",'Q S C=C+1,IC=I G PREFIXI:C=1
 I  S %ERROR="Too many "",""'s in [dir,sys] prefix" QUIT  ;Comma
 G PREFIXI ;Loop
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
PREFIX2 S:'C IC=I S %DIR=$E(Y,2,IC-1),%SYS=$E(Y,IC+1,I-1)
 I %DIR="" QUIT:%SYS=""  G NULLDIR
 I $E(%DIR)="""",$E(%DIR,$L(%DIR))="""",$L(%DIR,"""")=3
 I  S %DIR=$E(%DIR,2,$L(%DIR)-1)
 E  I %DIR]"" S $zt="%DIRERR",@("%DIR="_%DIR),$zt=""
 I $E(%SYS)="""",$E(%SYS,$L(%SYS))="""",$L(%SYS,"""")=3
 I  S %SYS=$E(%SYS,2,$L(%SYS)-1)
 E  I %SYS]"" S $zt="%SYSERR",@("%SYS="_%SYS),$zt=""
 I %DIR="",%SYS]"" G NULLDIR
 QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
%DIRERR S %ERROR="Error parsing directory: "_%DIR QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
%SYSERR S %ERROR="Error parsing directory set: "_%SYS QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
NULLDIR S %ERROR="Directory cannot be null if directory set is specified" QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
RSETS ;parse as a routine set
 S PRE="@"_$S($E(Y,2)="@":"@",1:""),Y=$E(Y,$L(PRE)+1,999)
 D PREFIX S J=I F I=I+1:1 QUIT:"."[$E(Y,I)  ;get dir/sys & routine
 S %ROU=$E(Y,J+1,I-1) I %ROU="" S %ERROR="No Routine Set specified." QUIT
 S %EXT=$E($P($E(Y,I+1,999),"."))
 S %EXT=$S(%EXT="":"","LC"[%EXT:"LST",1:"?")
 S %VER=$P($E(Y,I+1,999),".",2)
 I %EXT="?" S %ERROR="Invalid extension for Routine Sets" QUIT
 I '%VER S %VER="",%ROU=PRE_%ROU QUIT
 S %ROU=PRE_%ROU QUIT
REST ;Parse $E(Y,I+1,999): %ROU.%EXT.%VER
 ;First parse to I=1+last character in %ROU specification
 S IL=I F I=I+1:1 I "."[$E(Y,I) S %ROU=$TR($E(Y,IL+1,I-1),"-",":") QUIT
 I %ROU="" S %ERROR="No routine(s) specified" QUIT
 I %ROU[":",%ROU["*"
 I  S %ERROR="Cannot use ""*"" and "":"" in routine specification" QUIT
 I %ROU[":",%ROU["?"
 I  S %ERROR="Cannot use ""?"" and "":"" in routine specification" QUIT
 I $L(%ROU,"*")>2
 I  S %ERROR="Cannot use more than 1 ""*"" in routine specification" QUIT
 S r=%ROU,max=0,chk=0 S:$E(r)="'" r=$E(r,2,$L(r)) G EXT:%ROU="="
 I r[":" F i=1:1:$L(r,":") D CHKROU($P(r,":",i)) QUIT:%ERROR]""
 I r'[":" D CHKROU(r)
 QUIT:%ERROR]""
 ;At this point, $E(Y,I)="." or null. Parse $E(Y,I+1,999) for %EXT.%VER
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
EXT I $E(Y,I)="" S %EXT="",%VER="" QUIT
 ;%ROU or [dir,sys]%ROU without extension or version
 S E=$$UC($E(Y,I+1,$L(Y))),%EXT=$P(E,"."),%VER=$P(E,".",2,999)
 I "*"'[%EXT,'$S(%EXT?3A:",MAC,INT,INC,OBJ,"[(","_%EXT_","),1:0)
 I  S %ERROR="Invalid extension: "_%EXT QUIT
 I "1*"'[%VER,(%EXT="INT")!(%EXT="OBJ")
 I  S %ERROR="Only 1 version exists for ."_%EXT_" routines" QUIT
 I "*"'[%VER,'$S(+%VER=%VER:1,1:0)
 I  S %ERROR="Invalid version: "_%VER QUIT
 I max,"*INC"'[%EXT S %ERROR="Invalid routine name: too long" QUIT
 QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
CHKROU(r) I $TR(r,"*?","")?.1"%".an S:$L(r)>31 max=1 QUIT
 S %ERROR="Invalid routine name" QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
SHORT ;given Y?1"$".E -- define or show a shortcut
 S Y=$E(Y,2,$L(Y)) ;remove $
 I $E(Y)'="[" N IF,X,P,O S Y=$$UC(Y) DO  S %ERROR=" " QUIT  ;show def
 . S P=0,O=Y,IF=$$PATRN(.Y),X=Y S:X]"" X=$O(^mtemp1("SHORTCUT",X),-1)
 . F  S X=$O(^mtemp1("SHORTCUT",X)) Q:X=""  Q:$E(X,1,$L(Y))'=Y  DO
 . . Q:X'?@IF  I 'P DO  S P=1
 . . . W !!,$$LJ("Shortcut",15),$$LJ("Directory",25),"Directory Set",!
 . . W !?4,X,?14," "_$G(^mtemp1("SHORTCUT",X,"D")),?39," "_$G(^("S"))
 . W ! I 'P W "(no directory shortcuts found with '"_O_"')",!
 D PREFIX I %ERROR]"" G SCFAIL
 N CUT S CUT=$$ALPHAUP($E(Y,I+1,$L(Y))) I CUT'?1A.AN DO  G SCFAIL
 . S %ERROR="Invalid directory shortcut name"
 I %DIR="",%SYS="" DO  G SCFAIL
 . S %ERROR="Directory and Directory Set are both null?"
 I $D(^mtemp1("SHORTCUT",CUT,"D")) W !,"Overwriting definition... "
 S ^mtemp1("SHORTCUT",CUT,"D")=%DIR,^("S")=%SYS
 W !,"'"_CUT_"' set!" S %ERROR=" "
 QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
SCFAIL W !,"Directory Shortcut definition failure." QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
DOSHRT(CUT,DIR,SYS) ;set DIR and SYS based on CUT
 S CUT=$$ALPHAUP(CUT) ;normalize the name
 I '$D(^mtemp1("SHORTCUT",CUT)) DO  QUIT
 . S %ERROR="Shortcut '$"_CUT_"' does not exist!"
 S DIR=$G(^mtemp1("SHORTCUT",CUT,"D")),SYS=$G(^("S")) ;set & done!
 QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ALPHAUP(x) QUIT $$DP($$UC(x))
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
PATRN(X) N q,i,x,c S q=0,x="" F i=1:1:$L(X) S c=$E(X,i) S:c="""" c=c_c DO
 . I "*?&#"'[c S x=x_$S(q:c,1:"1"""_c),q=1 Q  ;simple text -- no pattern
 . S x=x_$E("""",q)_$S(c="&":"1A",c="#":"1N",c="*":".E",1:"1E"),q=0 Q
 S:q x=x_"""" S X=$P($P($P($P(X,"?"),"#"),"&"),"*") Q x ;return ?@x
LJ(x,n) Q ($E(x_$J("",n),1,n)_$E(x,n+1,$L(x))) ;left justify text to n chars
DP(x) Q $TR(x," !@#$%^&*()_-+={[}]:;,.?/|\'""~`")
UC(x) q $zcvt(x,"u")
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

