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

;%QULELAN^INT^1^59547,73885^0
%QULELAN ;;10:58 AM  6 Oct 1992; ; 06 Jan 93  2:42 PM
 
 
 
 
 
ABRV(RIVX,LG) N OBJ
 Q:'($D(@TRANSL@(@RIVX))) ""
 S OBJ=@TRANSL@(@RIVX) Q:OBJ="" ""
 Q $P(OBJ,$C(0),2)
 
 
 
FULL(TP) 
 N OBJ
 S OBJ=@TP@("O")
 Q:OBJ="" "" S OBJ=@TRANSL@(OBJ)
 Q $$NOMLOG^%QSF($P(OBJ,$C(0)))_" : "_$P(OBJ,$C(0),2)
 
 
 
INFO(TP) 
 N RES,%I,I,D,A,OBJP,OBJ,NUMET,CARETU,LIEN,REP,REPPERE,L,LQ
 N GRAP,CONF,TRANSL,DIAL,CAR
 S NUMET=@TP@("X"),CARETU=$$GLOCAR^%QULELAE(NUMET) D GETADR
 S OBJ=@TP@("O"),OBJP=@TP@("P")
 S LQ=1,L="*"
 I OBJP="" Q:'($D(@CONF@("*"))) "" S L="*",LQ=0 G INF20
 S L=@GRAP@(OBJP,OBJ)
 S OBJP=@TRANSL@(OBJP),REPPERE=$P(OBJP,$C(0)),OBJP=$P(OBJP,$C(0),2)
INF20 S OBJ=@TRANSL@(OBJ),REP=$P(OBJ,$C(0)),OBJ=$P(OBJ,$C(0),2)
 S:L'="*" L=$S($D(@CONF@(L)):L,1:"*")
 I '($D(@CONF@(L))) Q ""
 S RES=""
 S I="" F %I=1:1 S I=$O(@CONF@(L,"COM",I)) Q:I=""  S RES=RES_@CONF@(L,"COM",I)_$C(0)_I_$C(0)
 S I="" F %I=1:1 S I=$O(@CONF@(L,"ATT",I)) Q:I=""  S RES=RES_@CONF@(L,"ATT",I)_$C(0)_$$FORMEX^%QSCALVA(REP,OBJ,I)_$C(0)
 S:LQ'=0 LQ=$$QUAL^%QSGEL2(REPPERE,L)
 Q:'(LQ) RES
 S D=$$NOML1^%QSGES20(OBJP,OBJ,L,OBJ) Q:D="" RES
 S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D)) RES
 S I="" F %I=1:1 S I=$O(@CONF@(L,"LIEN",I)) Q:I=""  S RES=RES_@CONF@(L,"LIEN",I)_$C(0)_$$FORMEX^%QSCALVA(A,D,I)_$C(0)
 Q RES
 
 
 
REPINT(NIV) 
 Q:NIV=1 REP Q:$$TYPEL^%QSGES90(LIEN)>3 REP Q $$REPD^%QSGEL2(REP,LIEN)
 
 
 
POIDS(PER,FIL) 
 N REPI,RES,D
 Q:'($D(@CONF@("POIDS"))) 0 Q:'($D(@CONF@("ORDRE"))) 0 Q:'($D(@CONF@("LIEN"))) 0
 G:@CONF@("LIEN") PDSL
 S REPI=$$REPINT($S(PER="":1,1:2))
 S RES=$$^%QSCALIN(REPI,FIL,@CONF@("POIDS"),1)
 G PDSFI
PDSL I PER="" S RES="" G PDSFI
 S RES=$$^%QSCALIN($$LIENI^%QSGEL3,$$NOML1^%QSGES20(PER,FIL,LIEN,FIL),@CONF@("POIDS"),1)
PDSFI S:(RES+0)'=RES RES=-99999
 I @CONF@("ORDRE") S RES=-(RES)
 Q RES
 
 
GETADR S GRAP=$$CONCAS^%QZCHAD(CARETU,"G")
 S CONF=$$CONCAS^%QZCHAD(CARETU,"C"),TRANSL=$$CONCAS^%QZCHAD(CARETU,"T")
 S DIAL=$$CONCAS^%QZCHAD(CARETU,"GD"),CAR=$$CONCAS^%QZCHAD(CARETU,"GC")
 Q

