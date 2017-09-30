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

;%TLBAPLC^INT^1^59547,74028^0
TLBAPLC ;
 
INITPL 
 N I,J,DATEPLA,DATETRT,PLANB,CREPL,TEMP
 I MODEX'=3 G GOIN
 S PLAN=@GLOETD@(NIVEAU,"NOM.PLAN")
 S PLANE=@GLOETD@(NIVEAU,"NOM.ECHEC")
 S PLANR=@GLOETD@(NIVEAU,"NOM.SORTIE")
 Q
GOIN 
 S PLAN=$$CONCAS^%QZCHAD($$ADRESSE,TRT)
 I ETIQ="" S PLAN=$$CONCAS^%QZCHAD(PLAN,"PRINCIPAL")
 I ETIQ'="" S PLAN=$$CONCAS^%QZCHAD(PLAN,ETIQ) I PARTIE'="" S PLAN=$$CONCAS^%QZCHAD(PLAN,PARTIE)
 S PLANB=$$CONCAS^%QZCHAD(PLAN,"PLAN.BASE")
 
 S CREPL=0
 I '($D(@PLAN@("DATE"))) S CREPL=1 G CHMIER
 S DATEPLA=@PLAN@("DATE")
 S DATETRT=$$GETDATE^%TLGEST(TRT)
 I $$CMPDAT^%TLBAINT(DATEPLA,DATETRT)=1 G CHMIER
 
 K @(PLAN) S CREPL=1
CHMIER 
 S PLAN=$$CONCAS^%QZCHAD(PLAN,"ARBRE")
 S PLANR=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PLAN.EXECUTION") K @(PLANR)
 I '(CREPL) G EXISPL
 
CREAPL 
 D CREPLA^%TLBAINT(PLANB)
 G INIPLE
 
EXISPL 
 S I=""
BCTRI S I=$O(@PLAN@(I)) I I="" G INIPLE
 S J=""
BCTRJ S J=$O(@PLAN@(I,J)) I J="" G BCTRI
 S @PLANR@(I,@PLAN@(I,J),J)=0
 G BCTRJ
 
INIPLE 
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION") K @(TEMP)
 S TEMP=$$CONCAS^%QZCHAD(TEMP,"AFFICHAGE")
 S PLANE=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",ECHEC") K @(PLANE)
 S I=1
BCLECB I $D(@PLANB@(I)) S @PLANE@(@PLANB@(I))=0,@TEMP@(@PLANB@(I))=0,I=I+1 G BCLECB
 
 I (MODAF=2)!(MODAF=3) D INIABR^%TLBAINT(PLANR,TEMP) D:MODAF=2 REAF^%TLBAIF(2) D:$O(@PLANE@(""))'="" ARBAPP^%TLBAINT
 S PLAN=PLANR
 S PLANR=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",REUSSITES"),@PLANR=1
 S @GLOETD@(NIVEAU,"NOM.PLAN")=PLAN
 S @GLOETD@(NIVEAU,"NOM.SORTIE")=PLANR
 S @GLOETD@(NIVEAU,"NOM.ECHEC")=PLANE
 Q
 
STOPL 
 N I,J,K,PLANB
 I ABANDON Q
 S PLANB=$$CONCAS^%QZCHAD($$ADRESSE,TRT)
 I ETIQ="" S PLANB=$$CONCAS^%QZCHAD(PLANB,"PRINCIPAL")
 I ETIQ'="" S PLANB=$$CONCAS^%QZCHAD(PLANB,ETIQ) I PARTIE'="" S PLANB=$$CONCAS^%QZCHAD(PLANB,PARTIE)
 S @PLANB@("DATE")=$H
 S PLANB=$$CONCAS^%QZCHAD(PLANB,"ARBRE")
 S I=""
BCTII S I=$O(@PLAN@(I)) I I="" G FBCTIP
 S J=""
BCTIJ S J=$O(@PLAN@(I,J)) I J="" G BCTII
 S K=""
BCTIK S K=$O(@PLAN@(I,J,K)) I K="" G BCTIJ
 S @PLANB@(I,K)=$S($D(@PLANB@(I,K)):@PLANB@(I,K),1:0)+@PLAN@(I,J,K)
 G BCTIK
FBCTIP 
 Q
 
ININIV 
 S PROFAR=PROFAR+1,@TEMP=PROFAR
 S @TEMP@(PROFAR,"PERE")=NUMRG,@TEMP@(PROFAR,"FILS")="",@TEMP@(PROFAR,"BONUS.MALUS")=""
 S PERE=NUMRG,NUMRG="",BONMAL=""
 Q
FINNIV 
 K @TEMP@(PROFAR)
 S PROFAR=PROFAR-1,@TEMP=PROFAR
 I PROFAR'=0 S PERE=@TEMP@(PROFAR,"PERE"),NUMRG=@TEMP@(PROFAR,"FILS"),BONMAL=@TEMP@(PROFAR,"BONUS.MALUS")
 Q
 
REGSUI 
 N TEMP,PROFAR,PERE,BONMAL,VALP
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 S PROFAR=$S($D(@TEMP)#10:@TEMP,1:0)
 I PROFAR=0 S NUMRG=0 D ININIV G BCBM
 S PERE=@TEMP@(PROFAR,"PERE"),NUMRG=@TEMP@(PROFAR,"FILS"),BONMAL=@TEMP@(PROFAR,"BONUS.MALUS")
 I MODEX=3 Q
 I (ABANDON!ARRET)!STOP G PLUREG
 S VALP=$S($D(@PLAN@(PERE,BONMAL,NUMRG)):@PLAN@(PERE,BONMAL,NUMRG),1:0)
 I ECHEC=0 S @PLAN@(PERE,BONMAL,NUMRG)=VALP+1 K @PLANE@(NUMRG) S @PLANR@(@PLANR)=NUMRG,@PLANR@(@PLANR,"PAS")=@GLOETD@("PAS"),@PLANR=@PLANR+1 D ININIV
 I ECHEC=1,$D(@PLAN@(PERE,BONMAL,NUMRG)) S @PLAN@(PERE,BONMAL,NUMRG)=VALP-2
 I ECHEC=-1 K @PLANE@(NUMRG)
DEBCH 
 I $D(@TEMP@(PROFAR,"NOUVEAU.FILS")) G CHNVF
 I BONMAL'="" G BCFILS
BCBM 
 S BONMAL=$ZP(@PLAN@(PERE,BONMAL))
 I BONMAL="" S @TEMP@(PROFAR,"NOUVEAU.FILS")="" G CHNVF
 S NUMRG=""
BCFILS 
 S NUMRG=$O(@PLAN@(PERE,BONMAL,NUMRG))
 I NUMRG="" G BCBM
 I $$REUSSI(NUMRG) G BCFILS
 S @TEMP@(PROFAR,"FILS")=NUMRG,@TEMP@(PROFAR,"BONUS.MALUS")=BONMAL,@TEMP@(PROFAR,"TRAITES",NUMRG)=""
 S L=@TEMP@("AFFICHAGE",NUMRG)
 Q
CHNVF 
 S NUMRG=@TEMP@(PROFAR,"NOUVEAU.FILS")
BCHNVF 
 S NUMRG=$O(@PLANE@(NUMRG))
 I NUMRG="" G REMONT
 I $D(@TEMP@(PROFAR,"TRAITES",NUMRG)) G BCHNVF
 S @TEMP@(PROFAR,"FILS")=NUMRG,@TEMP@(PROFAR,"BONUS.MALUS")=1
 S @TEMP@(PROFAR,"NOUVEAU.FILS")=NUMRG
 S L=@TEMP@("AFFICHAGE",NUMRG)
 Q
REMONT 
 I ($O(@PLANE@(""))="")!(@PLANR=1) G PLUREG
 S @PLANR=@PLANR-1,@PLANE@(@PLANR@(@PLANR))=0
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("recusation du pas")_" : "_@PLANR@(@PLANR,"PAS"))
 D RECUS^%TLBAREC(@PLANR@(@PLANR,"PAS"))
 K @PLANR@(@PLANR)
 D FINNIV I PROFAR=0 G PLUREG
 S @PLAN@(PERE,BONMAL,NUMRG)=@PLAN@(PERE,BONMAL,NUMRG)-1
 G DEBCH
PLUREG 
 S NUMRG=0 I ABANDON'=2 K @(TEMP)
 S ECHGL=0 I $O(@PLANE@(""))'="" S ECHGL=1
 Q
 
TRTEXD 
 N TEMP,PROFAR,VALP,PERE,BONMAL,NUM,EXNUM
 I $$REUSSI(NUMRG) Q
 I ECHEC=-1 K @PLANE@(NUMRG) Q
 I ECHEC'=0 Q
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 S PROFAR=@TEMP,EXNUM=@TEMP@(PROFAR,"FILS") D CHERPL
 S @PLAN@(PERE,BONMAL,NUMRG)=VALP+1 K @PLANE@(NUMRG)
 S @PLANR@(@PLANR)=NUMRG,@PLANR@(@PLANR,"PAS")=@GLOETD@("PAS")
 S @PLANR=@PLANR+1 D ININIV
 S NUMRG=EXNUM D CHERPL
 Q
CHERPL 
 S PERE=@TEMP@(PROFAR,"PERE"),BONMAL=""
BCCHRB 
 S BONMAL=$O(@PLAN@(PERE,BONMAL))
 I BONMAL="" S BONMAL=1,VALP=0,@TEMP@(PROFAR,"NOUVEAU.FILS")=NUMRG G FINCHE
 S NUM=""
BCCHRE 
 S NUM=$O(@PLAN@(PERE,BONMAL,NUM))
 I NUM="" G BCCHRB
 I NUM'=NUMRG G BCCHRE
 S VALP=@PLAN@(PERE,BONMAL,NUMRG)
FINCHE 
 S @TEMP@(PROFAR,"FILS")=NUMRG,@TEMP@(PROFAR,"BONUS.MALUS")=BONMAL
 Q
CHREG(L) 
 N NUM,TEMP
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION,AFFICHAGE")
 S NUM=""
BCLCHR 
 S NUM=$O(@TEMP@(NUM))
 I NUM="" Q 0
 I L'=@TEMP@(NUM) G BCLCHR
 Q NUM
REGCOU() 
 N TEMP
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 S TEMP=@TEMP@(@TEMP,"FILS") Q TEMP
REUSSI(NUM) 
 Q '($D(@PLANE@(NUM)))
 
ADRESSE() 
 Q "^[QUI]RQSGLO(""TLBA"",""ARBRE.R"")"
 Q "^["""_QUI_"""]RQSGLO(""TLBA"",""ARBRE.R"")"

