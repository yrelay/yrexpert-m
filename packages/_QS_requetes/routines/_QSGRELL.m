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

;%QSGRELL^INT^1^59547,73882^0
%QSGRELL(B1,E1,CH,B2,LDE,BDE,E2) 
 
 
 
 
 
 
 
 
 
 
 
 
 N BD,C,I,%I,L,LD,NV,PB,R,T,BI1,BI2 S PB=0 K ^LRELL($J) S ^LRELL($J)=0
 S BI1=$$NOMINT^%QSF(B2),BI2=$$NOMINT^%QSF(BDE)
 S:BI1="" BI1=B2 S:BI2="" BI2=BDE
 
 S NV=0 F I=1:1:$L(CH) S:$E(CH,I)="^" NV=NV+1
 S NV=NV+1
 
 S BD=B2 F I=NV:-1:1 S C=$P($P(CH,"^",I),"(",1),T(I)=$$^%QSTYPAT(BD,C),PB=T(I)="" Q:PB  S R(I)=BD,C(I)=C,BD=$$^%QSBASAT(BD,C),PB=BD="" Q:PB
 I PB D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Impossible de parcourir le chemin complet ...") H 1 D POCLEPA^%VVIDEO Q 0
 
 
 
 S BD=B1,LD=E1 F I=1:1:NV D TI Q:N=0
 I BI1'=BI2 S @E2=N Q N
 
 K ^LRELL($J)
 S N=0,I=""
 F %I=0:0 S I=$O(@E2@(I)) Q:I=""  D CONT
 S @E2=N
 Q N
CONT 
 I $D(@LDE@(I)) S N=N+1 Q
 K @E2@(I) Q
TI I NV=I S L=E2
 E  S (L,^LRELL($J))=^LRELL($J)+1,L="^LRELL($J,"_L_")"
 S N=$$INT(BD,R(I),C(I),T(I),LD,L),LD=L,BD=R(I) Q
 
 
 
 
 
 
 
 
 
 
INT(RS,RE,AT,TYP,L1,L2) 
 N CARD,NC,NO,O,%O,V,%V,%V1,V1 S CARD=0,NC=^[QUI]RQSNCLES(RE),O=-1
 D POCLEPA^%VVIDEO W "."
 G @TYP
2 
 S AT=$$LIENI^%QSGEL2(RE,RS,AT,2)
 F %O=0:0 S O=$N(@L1@(O)) Q:O=-1  S NO=$P(O,",",1,NC) D ADDINT
 Q CARD
1 
 S AT=$$LIENI^%QSGEL2(RE,RS,AT,1)
 F %O=0:0 S O=$N(@L1@(O)) Q:O=-1  S V="" F %V=0:0 S V=$$NXTRIAV^%QSTRUC8(RS,O,AT,V) Q:V=""  S NO=O_","_V D ADDINT
 Q CARD
3 
 S AT=$$LIENI^%QSGEL2(RE,RS,AT,3)
 F %O=0:0 S O=$N(@L1@(O)) Q:O=-1  S V="" F %V=0:0 S V=$$NXTRIAV^%QSTRUC8(RS,O,AT,V) Q:V=""  S NO=V D ADDINT
 Q CARD
4 
 S AT=$$LIENI^%QSGEL2(RE,RS,AT,4)
 F %O=0:0 S O=$N(@L1@(O)) Q:O=-1  S V="" F %V=0:0 S V=$$NXTRIAV^%QSTRUC8(RS,O,AT,V) Q:V=""  S NO=V D ADDINT
 Q CARD
5 
 S AT=$$LIENI^%QSGEL2(RE,RS,AT,5)
 F %O=0:0 S O=$N(@L1@(O)) Q:O=-1  S V="" F %V=0:0 S V=$$NXTRIAV^%QSTRUC8(RS,O,AT,V) Q:V=""  S NO=V D ADDINT
 Q CARD
ADDINT S V1=$N(@L1@(O,""))
 G:V1'=-1 ADDVALOR
 Q:$D(@L2@(NO))
 S CARD=CARD+1
 S @L2@(NO)=@L1@(O) W:(CARD#10)=0 "*"
 Q
ADDVALOR F %V1=0:0 D ADDUNEVAL S V1=$O(@L1@(O,V1)) Q:V1=""
 Q
ADDUNEVAL Q:$D(@L2@(NO,V1))
 S:'($D(@L2@(NO))) CARD=CARD+1
 S @L2@(NO,V1)=V1
 W:(CARD#10)=0 "*"
 Q

