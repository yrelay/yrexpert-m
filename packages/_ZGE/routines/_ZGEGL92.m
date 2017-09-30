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

;%ZGEGL92^INT^1^59547,74037^0
%ZGEGL92 ;
 ;;^%ZGE("C",14,0)=EDT simulator
 ;;^%ZGE("C",14,1,0)=^90019.01^211^15
 ;;^%ZGE("C",14,1,200,0)=RIGHT^character right^
 ;;^%ZGE("C",14,1,200,1)=D NC
 ;;^%ZGE("C",14,1,201,0)=LEFT^character left^
 ;;^%ZGE("C",14,1,201,1)=D PC
 ;;^%ZGE("C",14,1,202,0)=UP^line up^
 ;;^%ZGE("C",14,1,202,1)=D PL
 ;;^%ZGE("C",14,1,203,0)=DOWN^line down^203
 ;;^%ZGE("C",14,1,203,1)=D NL
 ;;^%ZGE("C",14,1,208,0)=PAGE^next screen^208
 ;;^%ZGE("C",14,1,208,1)=D NS^%ZGEEDSF:A,PS^%ZGEEDSF:'A
 ;;^%ZGE("C",14,1,205,0)=PAGE-UP^prev screen^205
 ;;^%ZGE("C",14,1,205,1)=D NS^%ZGEEDSF:'A,PS^%ZGEEDSF:A
 ;;^%ZGE("C",14,1,0,0)=ESC^escape seq sur PC
 ;;^%ZGE("C",14,1,0,1)=R *ED
 ;;^%ZGE("C",14,1,8,0)=DEL^delete preceding character
 ;;^%ZGE("C",14,1,8,1)=Q:^ZGEMEM($J)=1  D DPC
 ;;^%ZGE("C",14,1,9,0)=TAB^tabulation
 ;;^%ZGE("C",14,1,9,1)=D TAB^%ZGEEDSF
 ;;^%ZGE("C",14,1,13,0)=CR^next line
 ;;^%ZGE("C",14,1,13,1)=Q:^ZGEMEM($J)=1  D CR
 ;;^%ZGE("C",14,1,17,0)=C-Q^repeat
 ;;^%ZGE("C",14,1,17,1)=S ^U($J,0,EDCL)=X,$P(%ED,U,1)=%EDI,%Q="How many times ",X=EMP D SET^%ZGEINSF,^%ZGEIN W " " S EDRP=X,X=^U($J,0,EDCL),$P(%ED,U,1)=%EDE D SET^%ZGEINSF S %=$S(EDRP:"R",1:0)
 ;;^%ZGE("C",14,1,20,0)=C-T^time
 ;;^%ZGE("C",14,1,20,1)=D T^%ZGEINSF
 ;;^%ZGE("C",14,1,22,0)=C-V^overstrike mode on/off
 ;;^%ZGE("C",14,1,22,1)=S EDOV='EDOV D STAT^%ZGEWORD
 ;;^%ZGE("C",14,1,23,0)=C-W^refresh screen
 ;;^%ZGE("C",14,1,23,1)=Q:^ZGEMEM($J)=1  D RF
 ;;^%ZGE("C",14,1,26,0)=C-Z^command mode^26
 ;;^%ZGE("C",14,1,26,1)=D C^%ZGEHLP
 ;;^%ZGE("C",14,1,127,0)=DEL^delete preceding character
 ;;^%ZGE("C",14,1,127,1)=Q:^ZGEMEM($J)=1  D DPC
 ;;^%ZGE("C",14,1,209,0)=DEL C^ delete next character^
 ;;^%ZGE("C",14,1,209,1)=Q:^ZGEMEM($J)=1  D DNC:A,DPC:'A
 ;;^%ZGE("C",14,1,210,0)=GOLD^GOLD functions (F1 ancien 80)^210
 ;;^%ZGE("C",14,1,210,1)=S DX=0,DY=EDSL+2 X XY W "GOLD " X XL R *ED:%BF(5) S ED=$D(^%ZGE("C",+%ED,2,ED,1))#2 W:'ED *7 X:ED ^(1)
 ;;^%ZGE("C",14,1,211,0)=HELP^help (F2)^
 ;;^%ZGE("C",14,1,211,1)=D PC^%ZGEHLP2
 ;;^%ZGE("C",14,1,212,0)=FNDNXT^find next (F3)^
 ;;^%ZGE("C",14,1,212,1)=Q:^ZGEMEM($J)=1  D FNS^%ZGEEDSF
 ;;^%ZGE("C",14,1,213,0)=DEL L^delete line (F4)^213
 ;;^%ZGE("C",14,1,213,1)=Q:^ZGEMEM($J)=1  D DNL:A,DPL:'A
 ;;^%ZGE("C",14,1,215,0)=COMMAND^command mode (F6)^
 ;;^%ZGE("C",14,1,215,1)=D C^%ZGEHLP
 ;;^%ZGE("C",14,1,218,0)=PRENDRE^ Prendre un groupe de lignes (F9)
 ;;^%ZGE("C",14,1,218,1)=D ^%ZGEPREN
 ;;^%ZGE("C",14,2,0)=^90019.02^82^13
 ;;^%ZGE("C",14,2,66,0)=BOTTOM^ (B) go to end of file
 ;;^%ZGE("C",14,2,66,1)=S ^U($J,0,EDCL)=X F %0=0:0 S EDN=$O(^(EDCL)) S:EDN EDCL=EDN I 'EDN S X=^U($J,0,EDCL),EDP=$L(X)+1 D MS^%ZGEEDSF Q
 ;;^%ZGE("C",14,2,84,0)=TOP^ (T) go to beginning of file
 ;;^%ZGE("C",14,2,84,1)=S (EDFL,EDN)=$O(^U($J,0,0)),EDP=1 D X,RF
 ;;^%ZGE("C",14,2,73,0)=INSERER^ (I) Insere un groupe de lignes
 ;;^%ZGE("C",14,2,73,1)=D ^%ZGEINSE
 ;;^%ZGE("C",14,2,77,0)=SELECT^ (M) mark beginning of paste buffer^230
 ;;^%ZGE("C",14,2,77,1)=S EDBB=EDCL_U_EDP
 ;;^%ZGE("C",14,2,76,0)=LINE^ (L) beg of line^232
 ;;^%ZGE("C",14,2,76,1)=D NL:A,PC:'A S EDP=1
 ;;^%ZGE("C",14,2,67,0)=CUT^ (C) removed marked region^238
 ;;^%ZGE("C",14,2,67,1)=D RB^%ZGEEDSF
 ;;^%ZGE("C",14,2,65,0)=RESET^ (A) reset
 ;;^%ZGE("C",14,2,65,1)=S A=1
 ;;^%ZGE("C",14,2,79,0)=OPEN LINE^ (O) open line at cursor position
 ;;^%ZGE("C",14,2,79,1)=Q:^ZGEMEM($J)=1  D CR,PC
 ;;^%ZGE("C",14,2,80,0)=PASTE^ (P) insert paste buffer at cursor
 ;;^%ZGE("C",14,2,80,1)=D WB^%ZGEEDSF
 ;;^%ZGE("C",14,2,82,0)=REPLACE^ (R) replace
 ;;^%ZGE("C",14,2,82,1)=Q:^ZGEMEM($J)=1  D FRQ^%ZGEEDSF,FNS^%ZGEEDSF:'%C S %=0
 ;;^%ZGE("C",14,2,83,0)=SECTION^ (S) section^240
 ;;^%ZGE("C",14,2,83,1)=D NS^%ZGEEDSF:A,PS^%ZGEEDSF:'A
 ;;^%ZGE("C",14,2,212,0)=FIND^ (F3) find string
 ;;^%ZGE("C",14,2,212,1)=D FQ^%ZGEEDSF S %=0 Q:%C  D FNS^%ZGEEDSF
 ;;^%ZGE("C",14,2,213,0)=UND L^ (F4) undelete line
 ;;^%ZGE("C",14,2,213,1)=Q:^ZGEMEM($J)=1  D PLL^%ZGEEDSF
 ;;^%ZGE("C",14,2,216,0)=SUBS^ (F7) find and change string
 ;;^%ZGE("C",14,2,216,1)=Q:^ZGEMEM($J)=1  S EDCLP=EDCL D RS^%ZGEEDSF,FNS^%ZGEEDSF S %=$S(EDRP:3,1:2)
 ;;^%ZGE("C",14,2,55,0)=RIGHT^character right^
 ;;^%ZGE("C",14,2,55,1)=D NC
 ;;^%ZGE("C",14,2,56,0)=WORD^word move^
 ;;^%ZGE("C",14,2,56,1)=D NW:A,PW:'A
 ;;^%ZGE("C",14,2,57,0)=EOL^end of line^
 ;;^%ZGE("C",14,2,57,1)=D NC:A,PL:'A S EDP=$L(X)+1
 ;;^%ZGE("C",14,2,52,0)=DEL C^ (4) delete character^
 ;;^%ZGE("C",14,2,52,1)=Q:^ZGEMEM($J)=1  D DNC:A,DPC:'A
 ;;^%ZGE("C",14,2,53,0)=DEL W^ (5) delete word^
 ;;^%ZGE("C",14,2,53,1)=Q:^ZGEMEM($J)=1  D DNW:A,DPW:'A
 ;;^%ZGE("C",14,2,54,0)=DEL L^ (6) delete line ^
 ;;^%ZGE("C",14,2,54,1)=Q:^ZGEMEM($J)=1  D DNL:A,DPL:'A
 ;;^%ZGE("C",14,2,49,0)=UND C^ (1) undelete character
 ;;^%ZGE("C",14,2,49,1)=Q:^ZGEMEM($J)=1  D PLC^%ZGEEDSF
 ;;^%ZGE("C",14,2,50,0)=UND W^ (2) undelete word
 ;;^%ZGE("C",14,2,50,1)=Q:^ZGEMEM($J)=1  D PLW^%ZGEEDSF
 ;;^%ZGE("C",14,2,51,0)=UND L^ (3) undelete line
 ;;^%ZGE("C",14,2,51,1)=Q:^ZGEMEM($J)=1  D PLL^%ZGEEDSF
 ;;^%ZGE("C",14,3)=0^0^0^^60^31
 ;;^%ZGE("C",14,4)=U 0
 ;;^%ZGE("C",14,5,0)=^90019.03^27^6
 ;;^%ZGE("C",14,5,5,0)=EXIT^save file and exit
 ;;^%ZGE("C",14,5,5,1)=W "EXIT" S ^U($J,0,EDCL)=X D @($S('$D(%MAXXED):"SAV^%ZGEWORD",1:"SAV^%ZGEMAX")) S %="Q"
 ;;^%ZGE("C",14,5,8,0)=HELP^help
 ;;^%ZGE("C",14,5,8,1)=Q:^ZGEMEM($J)=1  W "HELP" S SET=5 D H^%ZGEINSF S EDLL=EDSL,%=3
 ;;^%ZGE("C",14,5,17,0)=QUIT^exit without saving file
 ;;^%ZGE("C",14,5,17,1)=W "QUIT" S %="Q"
 ;;^%ZGE("C",14,5,18,0)=READ^read new file
 ;;^%ZGE("C",14,5,18,1)=Q:$D(%MAXXED)  W "READ" D FILE^%ZGEWORD S %=0 Q:PGM=EMP  D LOAD^%ZGEWORD S %="S"
 ;;^%ZGE("C",14,5,23,0)=WRITE^write file to selected new file
 ;;^%ZGE("C",14,5,23,1)=Q:$D(%MAXXED)  W "WRITE" D FILE^%ZGEWORD S %=0 Q:PGM=EMP  S ^U($J,0,EDCL)=X D SAV^%ZGEWORD S X=^U($J,0,EDCL),%=0
 ;;^%ZGE("C",14,6)=S BS="$C(8)",FF="#",RM=80,SL=24,XL="W /EL",XY="w /C(DX,DY)",A=1

