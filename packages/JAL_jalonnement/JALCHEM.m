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

;JALCHEM^INT^1^59547,74867^0
JALCHEM(OP,INTER) 
 
 
 
 
 
 
 
 
 
 
 
 N A,U,O,O2,D,NSD,POP D NET
 N T,S,N,NG
 S NG=$J,S=1,T=0,POP=1
 F U=1:1 Q:'($D(OP(U)))  S ^[QUI]SOMGR($J,U)="" S:$D(OP(U+1)) ^[QUI]GRAPHE($J,U,U+1,POP)=0,POP=POP+1
 S (N,^[QUI]NOMGR($J))=U-1
 S O="" F U=0:0 S O=$O(INTER(O)) Q:O=""  S D="" F U=0:0 S D=$O(INTER(O,D)) Q:D=""  S ^[QUI]GRAPHE($J,O,D,POP)=INTER(O,D),POP=POP+1
 
 D ^DSTLFORD
 
 K INTER S O=0
 S NS=^[QUI]NOMGR($J) F U=2:1:NS S O2=^[QUI]PIBB($J,0,1,U),INTER(U-1,U)=O2-O,O=O2
 
NET K ^[QUI]GRAPHE($J),^[QUI]SOMGR($J),^[QUI]NOMGR($J),^[QUI]PIBB($J),^[QUI]PREDBB($J)
FIN Q

