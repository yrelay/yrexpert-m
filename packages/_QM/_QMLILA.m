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

;%QMLILA^INT^1^59547,73878^0
QMLILA ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ADR() 
 Q "^[QUI]ZLILA"
 
ADD(LZLILA,GZLILA) 
 N %A,A
 D DEL(LZLILA)
 S A="" F %A=0:0 S A=$O(@GZLILA@(A)) Q:A=""  S ^[QUI]ZLILA(LZLILA,A)=@GZLILA@(A)
 Q
 
ADD2(LZLILA,GZLILA,GIZLILA) 
 
 N %A,A,IND
 D DEL(LZLILA)
 S A="" F %A=0:0 S A=$O(@GZLILA@(A)) Q:A=""  D STO
 Q
STO 
 S ^[QUI]ZLILA(LZLILA,A)=$P(@GZLILA@(A),"^",1)
 
 S ^[QUI]ZLILA(LZLILA,A,"TITRE")=$P(@GZLILA@(A),"^",2)
 
 S IND=$P(@GZLILA@(A),"^",3)
 S ^[QUI]ZLILA(LZLILA,A,"INDICE")=$S(IND="":1,1:IND)
 
 S ^[QUI]ZLILA(LZLILA,A,"LONGUEUR")=$P(@GZLILA@(A),"^",4)
 
 Q
 
DEL(LZLILA) 
 K ^[QUI]ZLILA(LZLILA),^[QUI]ZLILAI(LZLILA)
 Q
 
EX(LZLILA) 
 Q:LZLILA="" 0
 Q:LZLILA="*" 1
 Q $D(^[QUI]ZLILA(LZLILA))
 
LIST(LZLILA) Q:LZLILA="" ""
 Q:$D(^[QUI]ZLILA(LZLILA))<9 ""
 Q:LZLILA="*" "*"
 Q $$CONCAS^%QZCHAD("^[QUI]ZLILA",LZLILA)
 
EXA(LZLILA,ATT) 
 Q:(LZLILA="")!(ATT="") 0
 I LZLILA="*" Q 1
 Q:'($D(^[QUI]ZLILA(LZLILA))) 0
 N I,RES,%I
 S I="",RES=0
 F %I=0:0 S I=$O(^[QUI]ZLILA(LZLILA,I)) Q:I=""  I ^[QUI]ZLILA(LZLILA,I)=ATT S RES=1 Q
 Q RES
 
INIT 
 K ^[QUI]ZLILA
 Q
 
CONC(LZLILA,NOEL) 
 
 Q:'($D(^[QUI]ZLILA(LZLILA,NOEL))) ""
 Q ^[QUI]ZLILA(LZLILA,NOEL)_$S('($D(^[QUI]ZLILA(LZLILA,NOEL,"INDICE"))):"",^[QUI]ZLILA(LZLILA,NOEL,"INDICE")="":"",1:"("_^[QUI]ZLILA(LZLILA,NOEL,"INDICE")_")")
 
TITRE(LZLILA,NOEL) 
 
 Q:'($D(^[QUI]ZLILA(LZLILA,NOEL))) ""
 I '($D(^[QUI]ZLILA(LZLILA,NOEL,"TITRE"))) Q ^[QUI]ZLILA(LZLILA,NOEL)
 Q $S(^[QUI]ZLILA(LZLILA,NOEL,"TITRE")'="":^[QUI]ZLILA(LZLILA,NOEL,"TITRE"),1:$$CONC(LZLILA,NOEL))
 
LONG(LZLILA,NOEL) 
 
 Q:'($D(^[QUI]ZLILA(LZLILA,NOEL))) ""
 I '($D(^[QUI]ZLILA(LZLILA,NOEL,"LONGUEUR"))) Q 15
 Q $S(^[QUI]ZLILA(LZLILA,NOEL,"LONGUEUR")="":15,1:^[QUI]ZLILA(LZLILA,NOEL,"LONGUEUR"))
 
INDICE(LZLILA,NOEL) 
 
 Q:'($D(^[QUI]ZLILA(LZLILA,NOEL))) ""
 Q $S('($D(^[QUI]ZLILA(LZLILA,NOEL,"INDICE"))):"",1:^[QUI]ZLILA(LZLILA,NOEL,"INDICE"))

