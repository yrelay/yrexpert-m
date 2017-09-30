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

;%RSETN^INT^1^58140,5740^0
%RSETN(prompt,access,exts,sort,old) ;build a sorted rtn list ; APJ822 11/22/99  ; Compiled March 6, 2000 19:35:39
 ;%system.INC ; DAS280 06/29/99 
 ;%ST.INC DAS309 11/08/99 
 ; %system.inc: compiled for NETWIDENAMESPACE
 ; %system.inc: compiled for DDPGROUPS
 ; %system.inc: compiled for NETMOREDCPDMN
 ; %system.inc: compiled for USECLUSTER
 ; %system.inc: compiled for RTNINGBL
 ; %system.inc: compiled for DBMSNSP
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
1 N %DIR,%SYS,%ROU,%EXT,%VER,db,dirful,list,dirset,%X,beg,r,from,upto
 I $G(prompt)="" S prompt="Routine(s): " ;default prompt
 S access=$$UC($G(access)),exts=$$UC($G(exts)),sort=$$UC($G(sort)),old=+$g(old)
 S:exts="" exts="MAC,INT" S:sort="" sort="DEVN" ;defaults
 S %msub=$$%msub(),$ze="",POP="" S:'$G(MDEBUG) $zt="ZT^"_$P($ZPOS,"^",2)
 S db=$c(1),dirful=$$DEFDIR()
 D ASKROU,SEARCH:list
 I $O(^mtemp(%msub,""))="" S POP=1 ;failed to select anything
Q QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
fixexts(e) N x S x="" S:e["INT" x=x_",INT" S:e["OBJ" x=x_",OBJ" QUIT $E(x,2,99)
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ZT I $ze'?1"<INTERRUPT>".E U 0 W !,"[Error: "_$p($p($ze,">"),"<",2)_"]" S $ze="" QUIT
 S POP=1,$ze="" U 0 W:$X ! W "[Interrupted--Aborting]" QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ASKROU ;Get list of routines prompt'[$c(1), or pairs of routines prompt[$c(1)
 N p1,p2,mode,defdir,defsys,up,%ERROR,not
 S p1=$P(prompt,$c(1)),p2=$P(prompt,$c(1),2) K list S list=0
NEXT S list=list+1 ;asking the list'th prompt
FROM W !,p1 R %X I %X="" W ! G DONE
 I $E(%X)="?" S mode=1 D HELP G FROM ;help information
 I $E(%X)="!" D WINDOW G FROM ;use routine set application
 I ".F.f"[$e(%X,1,2) d file^%RSET g FROM  
 S up=$o(list(1,list),-1),(defdir,defsys)=""
 I up S up=$P(list(1,up),$c(1)),defdir=$P(up,"@",2,999),defsys=$P(up,"@")
 S mode=1,not="" I $E(%X)="'" S not="'",%X=$E(%X,2,$L(%X))
 D CHKROU I %ERROR="",%ROU="=" S %ERROR="cannot use '=' in column 1"
 I %ERROR]"" G FROM:%ERROR?." " W "  [???]",!,"  ["_%ERROR_"]" G FROM
 i '($e(%DIR)="%"!($e(%DIR)="^")!(%DIR=""&($e($zu(5))="%"!($e($zu(5))="^"))))&(%ROU="*")&(%EXT'="INC") s %ROU="A:zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
 S list(1,list)=%SYS_"@"_%DIR_$c(1)_not_%ROU_$c(1)_%EXT_$c(1)_%VER
 I p2]"",not="" G INTO
 G NEXT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
WINDOW ;use the routine set M/windows application
 w !,"This feature is no longer supported.",! q  
INTO ;ask for the value of the 2nd column
 W:$X+2>40 ! W ?40,p2 ;display the 2nd prompt
 R %X I %X="" W " (line ignored)" G FROM ;nothing asked, re-ask 1st
 I $E(%X)="?" S mode=2 D HELP G INTO ;help information
 I $E(%X)="." S mode=2 D DOTS G INTO ;dot commands
 S up=$o(list(2,list),-1),(defdir,defsys)=""
 I up S up=$P(list(2,up),$c(1)),defdir=$P(up,"@",2,999),defsys=$P(up,"@")
 S mode=2,not="" I $E(%X)="'" S not="'",%X=$E(%X,2,$L(%X))
 D CHKROU I %ERROR]"" W "  [???]",!,"  ["_%ERROR_"]" G FROM
 I %ROU="=" D EQUAL ;handle making routine name equal
 N O S O=list(1,list),O=$P(O,$c(1),2) I O[":",%ROU'=O
 I  W "  [???]",!,"  [cannot map ranges to different ranges]" G FROM
 S list(2,list)=%SYS_"@"_%DIR_$c(1)_%ROU_$c(1)_%EXT_$c(1)_%VER
 G NEXT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
EQUAL ;%ROU="=" and other things being 'equal'
 N X,B,O S O=list(1,list),%ROU=$P(O,$c(1),2),B=""
 I %DIR]"" S B=$S(%SYS="":"|"""_%DIR_"""|",1:"|""^"_%SYS_"^"_%DIR_"""|")
 S:%EXT="" %EXT=$P(O,$c(1),3) 
 I ",MAC,INC,"[(","_%EXT_","),%DIR="",%VER="" S %VER=0
 S:%VER="" %VER=$P(O,$c(1),4)
 S X="" S:%EXT]"" $P(X,".",2)=%EXT S:%VER>0 $P(X,".",3)=%VER
 S X="  ( "_B_%ROU_X_" )" W:$X+$L(X)>74 !?74-$L(X) W X QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
HELP G ^%URSETH
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
SEARCH G SEARCH^%URSETB ;given list(), produce the resulting list of routines
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
DONE S list=list-1 QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
CHKROU ;given %X and mode, parse and perform validation
 i $e(%X,1)="-" S %ERROR="cannot use '-' in column 1" q  
 D ^%URSETP(%X,defdir,defsys) QUIT:%ERROR]"" 
 ;returns %DIR,%SYS,%ROU,%EXT,%VER
 N acc S acc=$P(access,$c(1),mode) ;access permission for column 'mode'
 I %SYS]"",acc'["S" S %ERROR="Cannot specify remote directory set" QUIT
 I %DIR]"",acc'["D" S %ERROR="Cannot specify alternate directory" QUIT
 I %ROU="=" QUIT:mode=2  S %ERROR="Cannot be equal to anything." QUIT
 I mode=2,$E(%ROU)="@" S %ERROR="Cannot specify Routine Sets here." QUIT
 I $E(%ROU)="@" G RSET ;lookup the routine set
 I %EXT="",exts'["MAC",exts'["INT"
 I  S %ERROR="Cannot use <null> extension here: "_exts_" only." QUIT
 I %EXT?3A,exts'[%EXT
 I  S %ERROR="Cannot use extension """_%EXT_""": "_exts_" only." QUIT
 I %EXT="",%VER
 I  S %ERROR="Cannot use <null> extension except with current version" QUIT
 I mode=1,%ROU'["*",%ROU'["?",%ROU'[":",%EXT'["*",%VER'["*"
 I  D EXISTS QUIT:%ERROR]""  I 1 ;specific routine requested, exists?
 E  D PERMIT QUIT:%ERROR]""  ;allowed to access that directory?
 QUIT:mode=1  ;all the checks for single column prompting
 I $E(%ROU)="'" S %ERROR="Cannot use ""'"" here." QUIT
 N l1 S l1=list(1,list)
 I %ROU="*",%EXT'="INC",$P(l1,$C(1),2)="A:zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" S %ROU="A:zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
 I (%ROU["*")'=($P(l1,$c(1),2)["*")
 I  S %ERROR="Wild card unmatched in the routine specification" QUIT
 I $L(%ROU,"?")'=$L($P(l1,$c(1),2),"?")
 I  S %ERROR="Wild card unmatched in the routine specification" QUIT
 I %ROU[":",%ROU'=$P(l1,$c(1),2)
 I  S %ERROR="Routine range specifications are unmatched." QUIT
 I (%EXT["*")'=($P(l1,$c(1),3)["*")
 I  S %ERROR="Wild card unmatched in the extension specification." QUIT
 I (%VER["*")'=($P(l1,$c(1),4)["*")
 I  S %ERROR="Wild card unmatched in the version specifications." QUIT
 I %EXT'="INC",%ROU["*",$L(%ROU)>$L($P(l1,$c(1),2))
 I  W !,"[WARNING: Routine names may be truncated]"
 I %VER<0 S %VER=$$BACKVER(%EXT,%ROU,%VER,%DIR,%SYS) S:%VER="" %ERROR="does not exist" QUIT
 QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
EXISTS I $E(%ROU)="'" S %ROU=$E(%ROU,2,999) ;remove not indicator
 S $zt="PERMERR" G EXIST:%EXT]"" N %EXT,II S II=0 ;does routine exist?
 F %EXT="MAC","INT" S %ERROR="" D EXIST I %ERROR]"" S II=II+1
 S %ERROR=$S(II=2:"does not exist",1:"") QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
EXIST I %EXT="OBJ" QUIT  ;can't test yet
 N R S R=$S(%EXT="INC":%ROU,1:$E(%ROU,1,31))
 S:'$$ISROU(%DIR,%SYS,R,%EXT,%VER) %ERROR="does not exist" QUIT
PERMERR S $zt="",%ERROR="Routine Source inaccessible from that Directory" QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
PERMIT S $zt="PERMERR" ;check if access permitted
 n ENV 
 i %SYS="" s ENV=%DIR
 e  s ENV="^"_%SYS_"^"_%DIR
 I %EXT="OBJ",$D(^|ENV|mtemp1("ROU"))
 I %EXT'="OBJ",$D(^|ENV|ROUTINE)
 QUIT
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
ISROU(D,S,ROU,EXT,V) I ROU="" QUIT 0 ;is Directory/Set/Version of ROU.EXT real?
 n ENV 
 i S="" s ENV=D
 e  s ENV="^"_S_"^"_D
 I EXT="INT" QUIT $D(^|ENV|ROUTINE(ROU))
 I EXT="OBJ" QUIT $D(^|ENV|mtemp1("ROU",ROU))
 I $g(old)=1,EXT="MAC" QUIT $D(^|ENV|ROUTINE(0,"MAC",V,ROU))
 I $g(old)=1,EXT="INC" QUIT $D(^|ENV|ROUTINE(0,"INC",V,ROU))
 I $g(old)=2,EXT="MAC" QUIT $D(^|ENV|mMAC(ROU))
 I $g(old)=2,EXT="INC" QUIT $D(^|ENV|mINC(ROU))
 I V,((EXT="MAC")!(EXT="INC")) S V=$$BACKVER(EXT,ROU,V,D,S)
 I EXT="MAC",'V QUIT $D(^|ENV|rMAC(ROU,0))
 I EXT="MAC",V QUIT $D(^|ENV|rMACSAVE(ROU,V))
 I EXT="INC",'V QUIT $D(^|ENV|rINC(ROU,0))
 I EXT="INC",V QUIT $D(^|ENV|rINCSAVE(ROU,V))
 QUIT 0 ;should not get here since those are all the allowed extensions
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
BACKVER(EXT,ROU,V,D,S) I V'<0 Q V
 N BACK,I S BACK=""
 n ENV 
 i S="" s ENV=D
 e  s ENV="^"_S_"^"_D
 I EXT="MAC" F I=0:-1:(V+1) S BACK=$o(^|ENV|rMACSAVE(ROU,BACK),-1) Q:BACK=""
 I EXT="INC" F I=0:-1:(V+1) S BACK=$o(^|ENV|rINCSAVE(ROU,BACK),-1) Q:BACK=""
 Q $S(BACK:BACK,1:V)
RSET ;given %ROU = @rsetname or @@rsetname
 N PRE,R S PRE="@",R=$E(%ROU,2,999) S:$E(R)="@" PRE="@@",R=$E(R,2,999)
 N RSET S RSET=$$RSETX(R,%DIR,%SYS)
 I 'RSET S %ERROR="no set selected" QUIT
 S %VER=RSET QUIT  ;everything else remains the same, %VER is set pointer
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
RSETX(nm,rsetdir,rsetsys) ;returns RSET pointer to the selected routine set
 N RSET,name,title,oname,otitl,CNT,GOT,MORE,ONE
 S rsetdir=$G(rsetdir),rsetsys=$G(rsetsys)
 n RU,notwild,rsetname,rsindex,startlist
 S CNT=0,GOT=0,MORE=0,ONE=0,startlist=0 D INITL ;initialize the lookup
LOOK D NEXTL I 'RSET S MORE=0 D CHOOSE:CNT,CLOSEL QUIT GOT
 I CNT>9 S MORE=1 D CHOOSE K CNT S CNT=0 I GOT D CLOSEL QUIT GOT
 S CNT=CNT+1,CNT(CNT)=RSET ;add to the list
 I 'ONE,CNT=2 S ONE=1 W !," 1. "_oname,?20," "_otitl
 I 'ONE S oname=name,otitl=title G LOOK
 W !,$J(CNT,2)_". "_name,?20," "_title
 G LOOK
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
INITL ;
 s rsindex=$$%msub()
 q     
NEXTL ;
 s RU=$zcvt(R,"U")
 s rsetname=RU
 i startlist=10 g getone
 i $g(notwild)=1 s RSET=0 q  
 i $d(^[rsetdir,rsetsys]mutil("rset","name",RU)) d  q  
 . s notwild=1
 . s RSET=$o(^[rsetdir,rsetsys]mutil("rset","name",RU,""))
 . s name=$p(^[rsetdir,rsetsys]mutil("rset","name",RU,RSET),db,1)
 . s title=$p(^[rsetdir,rsetsys]mutil("rset","name",RU,RSET),db,2)   
 i ONE=0 d  
 . s startlist=1
 . s RSET=""
 . f  s rsetname=$o(^[rsetdir,rsetsys]mutil("rset","name",rsetname)) q:rsetname=""  d  
 . . s RSET=$o(^[rsetdir,rsetsys]mutil("rset","name",rsetname,RSET)) q:RSET=""
 . . s ^mtemp(rsindex,0,rsetname,RSET)=^[rsetdir,rsetsys]mutil("rset","name",rsetname,RSET)
 . . s name=$p(^[rsetdir,rsetsys]mutil("rset","name",rsetname,RSET),db,1)
 . . s title=$p(^[rsetdir,rsetsys]mutil("rset","name",rsetname,RSET),db,2)
 . . i startlist=1 s firstset=rsetname,lastname=""
 . . s startlist=10
 i '$d(^mtemp(rsindex)) q  
getone ;
 s rsetname=$o(^mtemp(rsindex,0,lastname)) 
 i rsetname'="" s lastname=rsetname
 e  s RSET=0 q  
 s RSET=$o(^mtemp(rsindex,0,rsetname,""))
 s name=$p(^[rsetdir,rsetsys]mutil("rset","name",rsetname,RSET),db,1),title=$p(^[rsetdir,rsetsys]mutil("rset","name",rsetname,RSET),db,2)
 q  
CHOOSE I 'ONE S GOT=CNT(1) QUIT  ;if unique, do it without asking
 I CNT=1 S:$$YN("Okay","Y")="Y" GOT=CNT(1) QUIT
 I MORE W !,"(more)"
 ;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
WHICH R !,"Which one: ",R I R="" QUIT
 I $E(R)="?" W !,"Select 1 - "_CNT_", or (null) to continue" G WHICH
 I R?1.N,R\1=R,$D(CNT(R)) S GOT=CNT(R) Q
 W *7," ? for help" G WHICH
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
CLOSEL ;
 k ^mtemp(rsindex)
 q  
%msub() Q $I(^mtemp)
DEFDIR() ;return the default (current) directory name
 Q "" ;Cache site -- can't do it yet
UC(x) q $zcvt(x,"u")
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

