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

;%QSNUPL2^INT^1^59547,73882^0
%QSNUPL2(A,LD,B,N) 
 
 
 
 
 
 
 
 
 
 
 
 
 N VAL,I,I2,J,L,NB,NBB,V,%V,ATS,OKECR,O,%O
 K @(N) S @N=1
 S L=$$RED^%ANA(A,"LATT"),NBB=0
 S OKECR=$$GET^%SGVAR("ECR")
 F I=1:1 S J=$P(L,",",I) Q:J=""  S ATS=J_"/"_$$NOMLOG^%QSF(B) D ADD S @N@(J)=NB,@N=@N*NB
 Q
ADD G:IND=0 ADD2
 S V="",NB=0 F %V=0:0 S V=$O(@LD@(V)) Q:V=""  S VAL=$$GETVAL^%QSTRUC8(B,V,J,IND),NBB=NBB+1 W:((NBB#10)=0)&OKECR "." I VAL'="" S:$$TYPE^%QSGESPE(ATS)="DATE" VAL=$$AFFI^%QMDAUC(B,J,VAL) S @N@(J,VAL,V)="",NB=NB+1
 Q
ADD2 S V="",NB=0 F %V=0:0 S V=$O(@LD@(V)) Q:V=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(B,V,J,O) Q:O=""  S VAL=$$VALEUR^%QSTRUC8(B,V,J,O) S:$$TYPE^%QSGESPE(ATS)="DATE" VAL=$$AFFI^%QMDAUC(B,J,VAL) S @N@(J,VAL,V)="",NB=NB+1 W:((NB#10)=0)&OKECR "."
 Q

