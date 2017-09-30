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

;VARMECA^INT^1^59547,74877^0
VARMECA ;
 
RETERR S %RESULTAT=1,$ZT=^TOZE($I,"A") Q:%ABEND=1  S NTOUR=$P(EXPFONC,"/",2),AVPMN=$P(EXPFONC,"/",3),TC=$P(EXPFONC,"/",4),P1=$P(EXPFONC,"/",5),P2=$P(EXPFONC,"/",6),P3=$P(EXPFONC,"/",7),P4=$P(EXPFONC,"/",8),%PAAAF=0
 S PCH=$S(P1'="":P1,1:1) D TO^%QZNBN1 S:'(ISNUM) @("P1="_P1) S PCH=$S(P2'="":P2,1:1) D TO^%QZNBN1 S:'(ISNUM) @("P2="_P2) S PCH=$S(P3'="":P3,1:1) D TO^%QZNBN1 S:'(ISNUM) @("P3="_P3) S PCH=$S(P4'="":P4,1:1) D TO^%QZNBN1 S:'(ISNUM) @("P4="_P4)
 S R1="1??" S:P2'=0 R1=P4/(314159E-5*P2) S R2=R1*P1,R3="1??" S:R2'=0 R3=P3/R2
 S NRO=0 F PAR1=NTOUR,AVPMN,TC S PAR=$P(PAR1,"""",2),NRO=NRO+1,V1="R"_NRO,V2=@V1 D:PAR'="" TR
FIN K P1,P2,P3,P4,R1,R2,R3,PCH,ISNUM,NTOUR,AVPMN,TC,V1,V2,PAR,NRO Q
TR S ^V($I,YA,PAR)=V2,^[QUI]RAISON(NUFA,TWREF,PAR)="^[QUI]IMPLICIT"_PRX,^[QUI]TVPAR(NUFA,TWREF,PAR)=V2 S:'($D(@^CPTPAR(1))) @^CPTPAR(1)=1 S ^[QUI]ORDEVAL(NUFA,TWREF,"ART",@^CPTPAR(1))=PAR_"^^"_V2
 I $D(^[QUI]EXPGIMP(PAR,V2))!$D(^[QUI]IGNORER(YA,PAR,V2)) S OPARA=PARA,%MODA="ART",PARA=PAR,VPA=V2 D ^TO3PASYS S PARA=OPARA K OPARA
 S @^CPTPAR(1)=@^CPTPAR(1)+1 Q

