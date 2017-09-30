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

;%RSHUF^INT^1^58140,5740^0
%RSHUF(PUSHPOP,DIR,SYS,ROU,EXT) ;Shuffle routine versions  ;LFT603, 9/16/98  ; Compiled March 6, 2000 19:35:40
 ;%system.INC ; DAS280 06/29/99 
 ;%ST.INC DAS309 11/08/99 
 ; %system.inc: compiled for NETWIDENAMESPACE
 ; %system.inc: compiled for DDPGROUPS
 ; %system.inc: compiled for NETMOREDCPDMN
 ; %system.inc: compiled for USECLUSTER
 ; %system.inc: compiled for RTNINGBL
 ; %system.inc: compiled for DBMSNSP
1 N DELVERS S DELVERS="" G GO
DELVERS(DELVERS,DIR,SYS,ROU,EXT) ;
 ;Entry point- pop versions >DELVERS up to DELVERS and greater,
 ;deleting version DELVERS
 N PUSHPOP S PUSHPOP="POP"
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
GO N D,S,OLD,NEW,I,A,J,VMAX S D=DIR,S=SYS,PUSHPOP=$$UC(PUSHPOP)
 I PUSHPOP="PUSH" G PUSHMI:EXT="MAC"!(EXT="INC"),PUSHINT:EXT="INT"
 I PUSHPOP="POP" G POPMI:EXT="MAC"!(EXT="INC"),POPINT:EXT="INT"
 U 0 W !,"invalid PUSH/POP parameter passed to '"_$P($ZPOS,"^",2)_"'"
 QUIT
PUSHMI N DGLO,I,K,OLD,SGLO
 n ENV 
 i S="" s ENV=D
 e  s ENV="^"_S_"^"_D
 S DGLO=$S(EXT="MAC":"^|"""_ENV_"""|rMAC",1:"^|"""_ENV_"""|rINC"),SGLO=DGLO_"SAVE"
 I $D(@DGLO@(ROU)) S NEW=$ZINCR(@SGLO@(ROU)) D
 . M @SGLO@(ROU,NEW)=@DGLO@(ROU,0)
 . S I="" F  S I=$O(@SGLO@(ROU,I)) Q:I=""  S OLD=$G(OLD)+1
 . S VMAX=$$MAXVER(EXT),K=""
 . I OLD>(VMAX-1) F I=1:1:(OLD-(VMAX-1)) S K=$O(@SGLO@(ROU,K)) Q:K=""  K ^(K)
 . I $D(@SGLO@(ROU))=1 K ^(ROU)
 E  D
 . S OLD="",VMAX=$$MAXVER(EXT)
 . F  S OLD=$ZP(^|ENV|ROUTINE(0,EXT,OLD)) QUIT:OLD=""  D
 .. I OLD=+OLD,OLD<VMAX,$D(^|ENV|ROUTINE(0,EXT,OLD,ROU))
 .. I  S NEW=OLD+1 D COPY(OLD,NEW) ;copy it to new version
 Q
COPY(OLD,NEW) ;copy from version OLD to version NEW
 n ENV 
 i S="" s ENV=D
 e  s ENV="^"_S_"^"_D
 K ^|ENV|ROUTINE(0,EXT,NEW,ROU)
 S DATE=$G(^|ENV|ROUTINE(0,EXT,OLD,ROU,0)) S:DATE="" DATE=$H
 S ^|ENV|ROUTINE(0,EXT,NEW,ROU,0)=DATE,A=""
LOOP S A=$O(^|ENV|ROUTINE(0,EXT,OLD,ROU,0,A)) I A="" Q
 S ^|ENV|ROUTINE(0,EXT,NEW,ROU,0,A)=^|ENV|ROUTINE(0,EXT,OLD,ROU,0,A)
 G LOOP
PUSHINT QUIT  ;not possible
POPMI N LBACK,NEW,OLD
 n ENV 
 i S="" s ENV=D
 e  s ENV="^"_S_"^"_D
 S OLD="^|ENV|"_$S(EXT="MAC":"rMACSAVE",1:"rINCSAVE")
 S NEW="^|ENV|"_$S(EXT="MAC":"rMAC",1:"rINC")
 I '($D(@NEW@(ROU))) G POPMIOLD
 S LBACK=$o(@OLD@(ROU,""),-1)
 I DELVERS=0 K @NEW@(ROU) I LBACK M @NEW@(ROU,0)=@OLD@(ROU,LBACK) K @OLD@(ROU,LBACK) K:$D(@OLD@(ROU))=1 @OLD@(ROU) Q
 Q:DELVERS=0
 K @OLD@(ROU,DELVERS)
 I $D(@OLD@(ROU))=1 K @OLD@(ROU)
 Q
POPMIOLD N CLICK,SOV S CLICK=0,OLD="",SOV=""
POPV ;
 n ENV 
 i S="" S ENV=D
 e  s ENV="^"_S_"^"_D
 S OLD=$O(^|ENV|ROUTINE(0,EXT,OLD)) I OLD="" G POPOUT
 I OLD'=+OLD G POPV ;not a valid version number
 I '$D(^|ENV|ROUTINE(0,EXT,OLD,ROU)) G POPV ;doesn't exist
 S NEW=OLD-1,SOV=OLD,CLICK=CLICK+1 I CLICK'>1 G POPV ;skip first one
 I NEW'<DELVERS D COPY(OLD,NEW)
 G POPV
 Q
POPOUT ;possibly delete the last version if it is too 'high'
 I +SOV=SOV,SOV'<DELVERS K ^|ENV|ROUTINE(0,EXT,SOV,ROU)
 QUIT
POPINT QUIT  ;not possible
MAXVER(EXT) N V
 i $d(^rMAC) S V=$S(EXT="MAC":$G(^rMACSAVE),EXT="INC":$G(^rINCSAVE),1:1)
 E  S V=$G(^ROUTINE(0,EXT))
 S:V<1 V=4 QUIT V ;max versions for MAC/INC
UC(x) q $zcvt(x,"u")

