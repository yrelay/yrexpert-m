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

;%ZGEGL10^INT^1^59547,74037^0
ZGEGLO10 ;;06:54 PM  11 May 1992; 14 Feb 89  9:14 AM
 ;;^%ZGE("C",12,2,109,1)=Q:^ZGEMEM($J)=1  D PLW^%ZGEEDSF
 ;;^%ZGE("C",12,2,110,0)=RESET^reset
 ;;^%ZGE("C",12,2,110,1)=S A=1
 ;;^%ZGE("C",12,2,112,0)=OPEN LINE^open line at cursor position
 ;;^%ZGE("C",12,2,112,1)=Q:^ZGEMEM($J)=1  D CR,PC
 ;;^%ZGE("C",12,2,114,0)=DEL EOL^delete end of line
 ;;^%ZGE("C",12,2,114,1)=Q:^ZGEMEM($J)=1  D DNL:A,DPL:'A
 ;;^%ZGE("C",12,2,116,0)=BOTTOM^go to end of file
 ;;^%ZGE("C",12,2,116,1)=S ^U($J,0,EDCL)=X F %0=0:0 S EDN=$O(^(EDCL)) S:EDN EDCL=EDN I 'EDN S X=^U($J,0,EDCL),EDP=$L(X)+1 D MS^%ZGEEDSF Q
 ;;^%ZGE("C",12,2,117,0)=TOP^go to beginning of file
 ;;^%ZGE("C",12,2,117,1)=S (EDFL,EDN)=$O(^U($J,0,0)),EDP=1 D X,RF
 ;;^%ZGE("C",12,2,118,0)=PASTE^insert paste buffer at cursor
 ;;^%ZGE("C",12,2,118,1)=D WB^%ZGEEDSF
 ;;^%ZGE("C",12,2,119,0)=COMMAND^command mode
 ;;^%ZGE("C",12,2,119,1)=D C^%ZGEHLP
 ;;^%ZGE("C",12,2,121,0)=REPLACE^replace
 ;;^%ZGE("C",12,2,121,1)=Q:^ZGEMEM($J)=1  D FRQ^%ZGEEDSF,FNS^%ZGEEDSF:'%C S %=0
 ;;^%ZGE("C",12,3)=0^0^0^^60^31
 ;;^%ZGE("C",12,4)=U 0        ;;:(RM:"S":"")
 ;;^%ZGE("C",12,5,0)=^90019.03^27^6
 ;;^%ZGE("C",12,5,4,0)=Dessin^ Definition d'un dessin
 ;;^%ZGE("C",12,5,4,1)=D ^%ZGEDES
 ;;^%ZGE("C",12,5,5,0)=EXIT^save file and exit
 ;;^%ZGE("C",12,5,5,1)=W "EXIT" S ^U($J,0,EDCL)=X D @($S('$D(%MAXXED):"SAV^%ZGEWORD",1:"SAV^%ZGEMAX")) S %="Q"
 ;;^%ZGE("C",12,5,8,0)=HELP^help
 ;;^%ZGE("C",12,5,8,1)=Q:^ZGEMEM($J)=1  W "HELP" S SET=5 D H^%ZGEINSF S EDLL=EDSL,%=3
 ;;^%ZGE("C",12,5,9,0)=(I)NSERER^ Insere un groupe de lignes
 ;;^%ZGE("C",12,5,9,1)=D ^%ZGEINSE
 ;;^%ZGE("C",12,5,16,0)=(P)RENDRE^ Prendre un groupe de lignes
 ;;^%ZGE("C",12,5,16,1)=D ^%ZGEPREN
 ;;^%ZGE("C",12,5,17,0)=QUIT^exit without saving file
 ;;^%ZGE("C",12,5,17,1)=W "QUIT" S %="Q"
 ;;^%ZGE("C",12,5,18,0)=READ^read new file
 ;;^%ZGE("C",12,5,18,1)=Q:$D(%MAXXED)  W "READ" D FILE^%ZGEWORD S %=0 Q:PGM=EMP  D LOAD^%ZGEWORD S %="S"
 ;;^%ZGE("C",12,5,23,0)=WRITE^write file to selected new file
 ;;^%ZGE("C",12,5,23,1)=Q:$D(%MAXXED)  W "WRITE" D FILE^%ZGEWORD S %=0 Q:PGM=EMP  S ^U($J,0,EDCL)=X D SAV^%ZGEWORD S X=^U($J,0,EDCL),%=0
 ;;^%ZGE("C",12,5,27,0)=ESC^help
 ;;^%ZGE("C",12,5,27,1)=W "HELP" S SET=5 D H^%ZGEINSF S EDLL=EDSL,%=3
 ;;^%ZGE("C",12,6)=S BS="$C(8)",FF="#,*27,*91,*50,*74,*27,*91,*72",RM=80,SL=24,XL="W *27,*91,*75",XY="S $X=250 W *27,*91,DY+1,*59,DX+1,*72 S $X=DX,$Y=DY",A=1 W *27,"="
 ;;^%ZGE("C",12,7)=K A W *27,">"
 ;;^%ZGE("C","B","EDT VT52 INPUT",10)=

