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

;DMD^INT^1^59547,74866^0
DMD ;
 
 S %RESULTAT=0
RETERR S $ZT=^TOZE($I,"A") Q:%ABEND=1  S %PAR=$P(EXPFONC,"/",2),@("%PAR="_%PAR)
 K ^DON($I),^VAL($I) F %FF=3:1 S %ARG=$P(EXPFONC,"/",%FF) Q:%ARG=""  S @("^DON($I,%FF)="_%ARG) I ^DON($I,%FF)'="" S ^VAL($I,^DON($I,%FF))=1
 S IND="" S:'($D(PARAP)) PARAP="" S:'($D(BISI)) BISI=PARAP G:BISI'["~" NOTIL F %U=2:1 S INC=$P(BISI,"~",%U) Q:INC=""  S:$D(^V($I,YA,INC)) IND=IND_"."_^V($I,YA,INC)
NOTIL S DE=6,FI=13 D ^%ABNETTO S DY=6,DX=5 X XY W "Le SF exige de demander la valeur de ",%PAR,IND
 I $D(^V($I,YA,%PAR_IND)) S DY=DY+2,DX=5 X XY W "Valeur actuelle de ",%PAR,IND," : ",^V($I,YA,%PAR_IND) S Y1=^V($I,YA,%PAR_IND) G DVU
 I $D(^VAL($I)) S DY=DY+1,DX=5 X XY W "Valeurs legales : ",! S %ARG=-1 F %FF=1:1 S %ARG=$N(^VAL($I,%ARG)) Q:%ARG=-1  W ?(((%FF-1)#4)*20)+5,%ARG I (%FF#4)=0 W !
QUES 
 S DE=13,FI=13 D ^%ABNETTO W "Valeur de ",%PAR,IND S DX=$X D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) G QUES
 I $D(^VAL($I)),'($D(^VAL($I,Y1))) D ^%VSQUEAK G QUES
DVU S ^V($I,YA,%PAR)=Y1,%RESULTAT=Y1,@%TABRA@(%PAR)="IMPLICIMODIFICATION",@%TABTV@(%PAR)=Y1,VPA=Y1 K OAPARA S:$D(PARA) OAPARA=PARA
 S PARA=%PAR,%MODA=$S(%TABTV["TV":"ART",1:"MAT"),$ZT="",^[QUI]ORDEVAL(NUFA,TWREF,%MODA,@^CPTPAR(1))=PARA_"^^"_VPA,@^CPTPAR(1)=@^CPTPAR(1)+1
 I VPA'="",$D(^[QUI]EXPGIMP(PARA,VPA)) D ^TO3PASYS
 S:$D(OAPARA) PARA=OAPARA
 S DE=6,FI=13 D ^%ABNETTO
FIN K %FF,DE,FI,%PAR,%ARG,OAPARA,VPA Q
 
 
 
TESTINCR 
 
 
JEU 
JEUP 
JEUT 
CONCLU S ^[QU]SCRC(NOMG)=16 Q:MOD=1  S ^[QU]SCRC(NOMG,"TITRE")=NOMG Q
 
 Q
LISJEU 
 ;
 ;

