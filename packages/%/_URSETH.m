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

;%URSETH^INT^1^58140,5742^0
%URSETH ; Cache SQL On-line Help for %qcurst ; LFT677 02/03/99  ; Compiled March 6, 2000 19:35:42
 ;%system.INC ; DAS280 06/29/99 
 ;%ST.INC DAS309 11/08/99 
 ; %system.inc: compiled for NETWIDENAMESPACE
 ; %system.inc: compiled for DDPGROUPS
 ; %system.inc: compiled for NETMOREDCPDMN
 ; %system.inc: compiled for USECLUSTER
 ; %system.inc: compiled for RTNINGBL
 ; %system.inc: compiled for DBMSNSP
1 ;enters with %X, $E(%X)="?"
 I $D(XECHELP) X XECHELP Q  ;default override help
 S %X=$$UC($E(%X_"?",2))
 I %X="D" G DIRHLP ;directory sets and directories help
 I %X="R" G SETHLP ;routine sets help
 I %X="E" G EXTHLP ;help with extensions
 I %X="L" G LSTHLP ;list the routines selected!
 G HELP ;default
HELP ; Usual HELP message
 W !!,"Enter a routine using one of the following formats:"
 W !,"   ROUTINE   (assumes extension MAC if it exists, INT otherwise)"
 W !,"or ROUTINE.EXTENSION   (assumes version 0)"
 W !,"or ROUTINE.EXTENSION.VERSION"
 W !,"or [NAMESPACE,SYSTEM]ROUTINE.EXTENSION.VERSION"
 W !!,"' followed by any of the above will EXCLUDE the routine from"
 W !,"list of generated routines."
 W !!,"For ROUTINE, one may enter:"
 W !,"  an individual routine (or include file)  e.g. ABC"
 W !,"  a range of routines separated by "":""     e.g. DI:DJ"
 W !,"  a set of routines using a wild-card ""*""  e.g. OEF*A"
 W !,"    (the * indicates zero or more characters)"
 W !,"For EXTENSION one can enter OBJ, INT, MAC, or INC."
 W !!,"Enter ?  to redisplay this help screen."
 W !,"      ?E to display information on allowed EXTENSIONS."
 W !,"      ?D to display a screen on Systems and Namespaces"
 W !,"      ?R to display additional help on Routine Sets"
 W !,"      ?L to list the routines currently selected."
 W ! Q
EXTHLP ;list information on extensionsand how to use them
 N MACOK,INTOK,INCOK,II S INCOK=(","_exts_","[",INC,")
 S MACOK=(","_exts_","[",MAC,"),INTOK=(","_exts_","[",INT,")
 W !!,"For EXTENSION one may enter one of the following:",!?5
 F II=1:1:$L(exts,",") W $S(II=1:"",1:",  ")_$P(exts,",",II)
 I II>1 W !,"or * to include "_$S(II=2:"both",1:"all")_" of the extensions"
 I MACOK,INTOK W !," <null> to select MAC if it exists, INT otherwise"
 E  I MACOK!INTOK W !," <null> to select "_$S(MACOK:"MAC",1:"INT")
 I 'MACOK,'INCOK
 I  W !,"VERSION must be 1 since no macro or include files can be"
 I  W !,"selected.",! Q
 W !!,"For VERSION, you may enter"
 W !,"  <null> for current version, -1 for last backup, -2 for prior, etc."
 W !,"  Note: Versions only apply to extensions MAC and INC",!
 Q
DIRHLP ;list out some namespace help
 n dr,ds,cm
 W !!,"SYSTEMS accessible from this machine:",!?3 D SYSLST
 W !!,"NAMESPACES within the current machine:",!?3 D DIRLST
 W ! Q
SYSLST ; List out the SYSTEMS
 S ds="",cm="",$zt="SYSERR^"_$P($ZPOS,"^",2)
SYSL n mgrns s mgrns="^^"_$ZU(12)
 S ds=$O(^|mgrns|NET(1,"ACTIVE","NACP",ds))
 I ds="" W:cm="" !,"<No SYSTEMS defined in configuration>" Q
 W cm W:$X+$L(ds)>75 !?3 W ds S cm=",  " G SYSL
SYSERR S $zt="" W !,$p($p($ze,">"),"<",2)_" while listing SYSTEMS",! Q
DIRLST n list,i,n 
 i '$zu(90,0) w !,"<No Namespaces specified in configuration>",! QUIT
 f i=1:1:$zu(90,0) s list($zu(90,2,0,i))=""
 s n="" f i=0:1 s n=$o(list(n)) q:n=""  w:'(i#4) ! w ?5+((i#4)*20),n
 QUIT
mgr() ;return the system manager's directory name
 QUIT "%SYS"
SETHLP ; routine set help
 W !!,"Routine Sets can be selected using the format:"
 W !,"  @ROUTINE-SET"
 W !,"Where ROUTINE-SET is a previously defined Routine Set"
 W !,"located in the current namespace."
 W !,"or:"
 W !,"  @[NSP,SYS]ROUTINE-SET"
 W !,"Where ROUTINE-SET is a previously defined Routine Set"
 W !,"located in the namespace NSP on the system SYS."
 W !!,"Routine Sets can be created by enter .FILE to the"
 W !,"Routine(s): prompt, followed by specifying the Routine Set"
 W !,"name and a short, one line, description of the Routine Set."
 W !!,"Enter part of a Routine Set name to list all the Routine"
 W !,"Sets that begin with that name.",!
 Q
LSTHLP ;list the routines so far
 I list=1 W !!,"No routines selected so far.",! Q
 N temp S temp=list-1 F i=1:1:temp S temp(1,i)=list(1,i)
 N list S list=temp F i=1:1:temp S list(1,i)=temp(1,i)
 K temp N %msub,sort
 S %msub=$$%msub^%RSETN(),$zt="LSTERR^"_$P($ZPOS,"^",2),$ze="",sort="DEVN" ;RLL142
 D SEARCH^%URSETB ;build up the list of routines ;RLL142
 I $O(^mtemp(%msub,""))="" W !!,"No routines selected so far."
 E  D LSTLST ;actually list the selected routines
LSTERR K ^mtemp(%msub) W !,$p($p($ze,">"),"<",2) QUIT
LSTLST ;actually select the routines
 N SD,SYS,DIR,EXT,VER,ROU,RCNT,POP
 S SD="",POP=0 W !!,"Routines Currently Selected:"
SSD S SD=$O(^mtemp(%msub,SD)) Q:SD=""
 S SYS=$P(SD,"@"),DIR=$P(SD,"@",2,999)
 D:DIR]"" CC("Namespace = "_DIR_$S(SYS]"":"System = "_SYS,1:""))
 F EXT="MAC","INT","OBJ","INC" S VER="" D SVER Q:POP
 Q:POP  G SSD
SVER S VER=$O(^mtemp(%msub,SD,EXT,VER)),ROU="",RCNT=0 Q:VER=""
SROU S ROU=$O(^mtemp(%msub,SD,EXT,VER,ROU)) I ROU="" G SVER
 D SONE Q:POP  G SROU
SONE ;print out one routine
 S RCNT=RCNT+1 I RCNT=1 D CC("-- "_EXT_$S(EXT="INT":"",'VER:"",1:"."_VER,1:"")_" --")
 W:RCNT=1 ! I $X\10+1*10+$L(ROU)>79 W !
 W:$X ?$X\10+1*10 W ROU Q
CC(x) W !!?80-$L(x)\2,x,! Q
UC(x) q $zcvt(x,"u")

